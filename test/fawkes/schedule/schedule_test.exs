defmodule Fawkes.ScheduleTest do
  use Fawkes.DataCase
  alias Fawkes.Schedule
  alias Fawkes.Schedule.Audience
  alias Fawkes.Schedule.Category
  alias Fawkes.Schedule.Event
  alias Fawkes.Schedule.Location
  alias Fawkes.Schedule.Slot
  alias Fawkes.Schedule.Speaker
  alias Fawkes.Schedule.Talk

  describe "Given schedule" do
    setup do
      {:ok, slot_2} =
        %Slot{}
        |> Slot.changeset(%{slug: :slot_2, start: "2018-09-06 08:30:00", finish: "2018-09-06 08:45:00"})
        |> Repo.insert()

      {:ok, slot_1} =
        %Slot{}
        |> Slot.changeset(%{slug: :slot_1, start: "2018-09-06 07:00:00", finish: "2018-09-06 08:30:00"})
        |> Repo.insert()

      {:ok, event} =
        %Event{}
        |> Event.changeset(%{slug: :day_1_registration, name: "Registration", slot_id: slot_1.id})
        |> Repo.insert()

      {:ok, audience_1} =
        %Audience{}
        |> Audience.changeset(%{slug: :general, name: "General"})
        |> Repo.insert()

      {:ok, audience_2} =
        %Audience{}
        |> Audience.changeset(%{slug: :beginner, name: "Beginner"})
        |> Repo.insert()

      {:ok, category_1} =
        %Category{}
        |> Category.changeset(%{slug: :blockchain, name: "Blockchain"})
        |> Repo.insert()

      {:ok, category_2} =
        %Category{}
        |> Category.changeset(%{slug: :nerves, name: "Nerves"})
        |> Repo.insert()

      {:ok, location} =
        %Location{}
        |> Location.changeset(%{slug: :grand_ballroom, name: "Grand Ballroom"})
        |> Repo.insert()

      jose = %{
        slug: :jose_valim,
        image: "images/jose-valim.jpg",
        first: "José",
        last: "Valim",
        company: "Plataformatec",
        github: "josevalim",
        twitter: "josevalim",
        description: "@plataformatec co-founder and creator of @elixirlang."
      }
      lance = %{
        slug: :lance_halvorsen,
        image: "images/lance-halvorsen.jpg",
        first: "Lance",
        last: "Halvorsen",
        company: "LeTote",
        github: "lancehalvorsen",
        twitter: "lance_halvorsen",
        description: "Lance is a member of the Phoenix core team and author of Functional Web Development with Elixir, OTP, and Phoenix. He is currently a Senior Software Architect at LeTote living in Portland, OR."
      }
      anna = %{
        slug: :anna_neyzberg,
        image: "images/anna-neyzberg.jpg",
        first: "Anna ",
        last: "Neyzberg",
        company: "Carbon Five",
        github: "aneyzberg",
        twitter: "aneyzb",
        description: "Anna Neyzberg is a San Francisco native who has done a lot of work in the ruby community in SF and currently sits on the board of RailsBridge. She has taken this community organizing experience and 2 years ago co-founded ElixirBridge in SF- an organization that offers free weekend long workshops, with the goal of creating an inclusive welcoming space for under-represented populations in tech to learn elixir. By day she works as a Developer at Carbon Five. When not in front of a keyboard, she is trying to get better at climbing rocks."
      }

      {:ok, speaker_1} =
        %Speaker{}
        |> Speaker.changeset(jose)
        |> Repo.insert()

      {:ok, speaker_2} =
        %Speaker{}
        |> Speaker.changeset(lance)
        |> Repo.insert()

      {:ok, speaker_3} =
        %Speaker{}
        |> Speaker.changeset(anna)
        |> Repo.insert()

      jose_talk = %{
        slug: "slot_3_jose_valim",
        title: "Keynote",
        slot_id: slot_2.id,
        speaker_id: speaker_1.id,
        category_id: category_1.id,
        audience_id: audience_2.id,
        location_id: location.id,
        description: ""
      }
      lance_talk = %{
        slug: "slot_5_lance_halvorsen",
        title: "Elixir at a Walking Pace",
        slot_id: slot_2.id,
        speaker_id: speaker_2.id,
        category_id: category_1.id,
        audience_id: audience_1.id,
        location_id: location.id,
        description: "<p>Many of us are initially attracted to Elixir because of its performance and fault tolerance. Make no mistake, these are stellar, but there are times when they are not the most critical requirements for our applications.</p>\n
  <p>We’re going to take a look at a warehouse management system, originally written as part of a Rails monolith, for which data consistency and message ordering matter more.</p>\n
  <p>That original system was deployed with Puma, forking multiple OS level processes on multiple nodes to gain parallel execution. That greatly increased the potential for multiple representations of an item in the system at any given moment. The result was an increase in stale data errors and inconsistent state.</p>\n
  <p>As we rebuilt the system in Elixir, we turned these problems inside out. Stateful BEAM processes and their mailboxes allowed us to ensure that there would only be a single representation of each item in the system as well as order the messages each process receives. Throughout this talk, we’ll see how we accomplished this. We’ll also see how we handled some issues associated with this approach, like the cold start problem and keeping memory usage in check.</p>\n"
      }
      anna_talk = %{
        slug: "slot_5_anna_neyzberg",
        title: "Exchange of Crypto Coins",
        slot_id: slot_2.id,
        speaker_id: speaker_3.id,
        category_id: category_2.id,
        audience_id: audience_1.id,
        location_id: location.id,
        description: "<p>We know that OTP is an important part of the elixir ecosystem. But why is it important and how does it work? How do we leverage OTP appropriately to build highly concurrent systems at scale. We will walk through the why and the how by building a crypto-currency exchange, and then adding load to the exchange to see OTP at work.</p>\n
<p>This talk will also provide context about crypto-currency and how the protocol is implemented - so that the audience has appropriate context for understanding building an exchange.</p>\n"
      }

      {:ok, talk_1} =
         %Talk{}
         |> Talk.changeset(jose_talk)
         |> Repo.insert()
      {:ok, talk_2} =
         %Talk{}
         |> Talk.changeset(lance_talk)
         |> Repo.insert()
      {:ok, talk_3} =
         %Talk{}
         |> Talk.changeset(anna_talk)
         |> Repo.insert()

      [slot_2: slot_2, slot_1: slot_1, event: event,
       audience_1: audience_1, audience_2: audience_2,
       category_1: category_1, category_2: category_2, location: location,
       speaker_1: speaker_1, speaker_2: speaker_2, speaker_3: speaker_3,
       talk_1: talk_1, talk_2: talk_2, talk_3: talk_3]
    end

    test "fetch/0 returns the schedule in order with preloads",
         %{slot_2: slot_2, slot_1: slot_1, event: event,
          audience_1: audience_1, audience_2: audience_2,
           category_1: category_1, category_2: category_2, location: location,
           speaker_1: speaker_1, speaker_2: speaker_2, speaker_3: speaker_3,
           talk_1: talk_1, talk_2: talk_2, talk_3: talk_3} do
      [slot_1_result, slot_2_result] = Schedule.fetch()

      assert slot_1_result.id == slot_1.id
      assert slot_2_result.id == slot_2.id

      assert slot_1_result.event.id == event.id

      slot_talk_1 =
        Enum.find(slot_2_result.talks,
                  fn(slot_talk) -> slot_talk.id == talk_1.id end)
      slot_talk_2 =
        Enum.find(slot_2_result.talks,
                  fn(slot_talk) -> slot_talk.id == talk_2.id end)
      slot_talk_3 =
        Enum.find(slot_2_result.talks,
                  fn(slot_talk) -> slot_talk.id == talk_3.id end)

      assert slot_talk_1.audience.id == audience_2.id
      assert slot_talk_2.audience.id == audience_1.id
      assert slot_talk_3.audience.id == audience_1.id

      assert slot_talk_1.category.id == category_1.id
      assert slot_talk_2.category.id == category_1.id
      assert slot_talk_3.category.id == category_2.id

      assert slot_talk_1.location.id == location.id
      assert slot_talk_2.location.id == location.id
      assert slot_talk_3.location.id == location.id

      assert slot_talk_1.speaker.id == speaker_1.id
      assert slot_talk_2.speaker.id == speaker_2.id
      assert slot_talk_3.speaker.id == speaker_3.id
    end

    test "fetch_by_audience/1 returns the schedule in order (by start time) with preloads",
         %{slot_2: slot_2, talk_1: talk_1} do
      [%{talks: [talk_result|[]]} = slot_result|[]] =
        Schedule.fetch_by_audience("beginner")

      assert slot_result.id == slot_2.id
      assert talk_result.id == talk_1.id
    end

    test "fetch_by_category/1 returns the schedule in order (by start time) with preloads",
         %{slot_2: slot_2, talk_3: talk_3} do
      [%{talks: [talk_result|[]]} = slot_result|[]] =
        Schedule.fetch_by_category("nerves")

      assert slot_result.id == slot_2.id
      assert talk_result.id == talk_3.id
    end

    test "fetch_speakers/0 returns all speakers in last-name-alphabetical",
         %{speaker_1: speaker_1, speaker_2: speaker_2, speaker_3: speaker_3} do
      [speaker_1_result, speaker_2_result, speaker_3_result] = Schedule.fetch_speakers()
      assert speaker_1_result.id == speaker_2.id
      assert speaker_2_result.id == speaker_3.id
      assert speaker_3_result.id == speaker_1.id
    end

    test "fetch_speakers/1 returns a speaker", %{speaker_3: speaker_3} do
      result = Schedule.fetch_speakers("anna_neyzberg")
      assert result.id == speaker_3.id
    end

    test "fetch_talks/1 returns a talk", %{talk_2: talk_2} do
      result = Schedule.fetch_talks("slot_5_lance_halvorsen")
      assert result.id == talk_2.id
    end
  end
end

defmodule Fawkes.Schedule.Seed.Event do
  import Ecto.Query
  alias Fawkes.Schedule.Slot
  alias Fawkes.Schedule.Event
  alias Fawkes.Repo

  def perform do
    Slot
    |> fetch_all_by_slug()
    |> data()
    |> Enum.each(fn(attrs) ->
         %Event{}
         |> Event.changeset(attrs)
         |> Repo.insert()
       end)
  end

  def data(relations) do
    [
      %{
        slug: :slot_1,
        name: "Registration",
        slot_id: relations[:slot_1]
      },
      %{
        slug: :slot_2,
        name: "Welcome",
        slot_id: relations[:slot_2]
      },
      %{
        slug: :slot_4,
        name: "Break",
        slot_id: relations[:slot_4]
      },
      %{
        slug: :slot_7,
        name: "Lunch",
        slot_id: relations[:slot_7]
      },
      %{
        slug: :slot_a,
        name: "Break",
        slot_id: relations[:slot_a]
      },
      %{
        slug: :slot_d,
        name: "Break",
        slot_id: relations[:slot_d]
      },
      %{
        slug: :slot_e,
        name: "Lightning Talks",
        slot_id: relations[:slot_e]
      },
      %{
        slug: :slot_f,
        name: "Registration",
        slot_id: relations[:slot_f]
      },
      %{
        slug: :slot_g,
        name: "Welcome",
        slot_id: relations[:slot_g]
      },
      %{
        slug: :slot_i,
        name: "Break",
        slot_id: relations[:slot_i]
      },
      %{
        slug: :slot_l,
        name: "Lunch",
        slot_id: relations[:slot_l]
      },
      %{
        slug: :slot_o,
        name: "Registration",
        slot_id: relations[:slot_o]
      },
      %{
        slug: :slot_r,
        name: "Registration",
        slot_id: relations[:slot_r]
      },
      %{
        slug: :slot_s,
        name: "Registration",
        slot_id: relations[:slot_s]
      }
    ]
  end

  defp fetch_all_by_slug(query) do
    query
    |> select([item], %{slug: item.slug, id: item.id})
    |> Repo.all
    |> Enum.reduce(%{}, fn(%{slug: slug, id: id}, acc) ->
         Map.put(acc, slug, id)
       end)
  end
end

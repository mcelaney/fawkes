defmodule Fawkes.Schedule.Seed.Slot do
  alias Fawkes.Schedule.Slot
  alias Fawkes.Repo

  def perform do
    Enum.each(data(), fn(attrs) ->
      %Slot{}
      |> Slot.changeset(attrs)
      |> Repo.insert()
    end)
  end

  def data do
    [
      %{
        slug: :slot_1,
        date: "Thursday, September 6, 2018",
        time: "7:00 AM - 8:30 AM"
      },
      %{
        slug: :slot_2,
        date: "Thursday, September 6, 2018",
        time: "8:30 AM - 8:45 AM"
      },
      %{
        slug: :slot_3,
        date: "Thursday, September 6, 2018",
        time: "8:45 AM - 9:45 AM"
      },
      %{
        slug: :slot_4,
        date: "Thursday, September 6, 2018",
        time: "9:45 AM - 10:15 AM"
      },
      %{
        slug: :slot_5,
        date: "Thursday, September 6, 2018",
        time: "10:15 AM - 10:55 AM"
      },
      %{
        slug: :slot_6,
        date: "Thursday, September 6, 2018",
        time: "11:00 AM - 11:40 AM"
      },
      %{
        slug: :slot_7,
        date: "Thursday, September 6, 2018",
        time: "11:40 AM - 1:00 PM"
      },
      %{
        slug: :slot_8,
        date: "Thursday, September 6, 2018",
        time: "1:00 PM - 1:40 PM"
      },
      %{
        slug: :slot_9,
        date: "Thursday, September 6, 2018",
        time: "1:45 PM - 2:25 PM"
      },
      %{
        slug: :slot_a,
        date: "Thursday, September 6, 2018",
        time: "2:25 PM - 3:00 PM"
      },
      %{
        slug: :slot_b,
        date: "Thursday, September 6, 2018",
        time: "3:00 PM - 3:40 PM"
      },
      %{
        slug: :slot_c,
        date: "Thursday, September 6, 2018",
        time: "3:45 PM - 4:25 PM"
      },
      %{
        slug: :slot_d,
        date: "Thursday, September 6, 2018",
        time: "4:25 PM - 4:45 PM"
      },
      %{
        slug: :slot_e,
        date: "Thursday, September 6, 2018",
        time: "4:45 PM - 6:15 PM"
      },

      %{
        slug: :slot_f,
        date: "Thursday, September 7, 2018",
        time: "8:00 AM - 8:50 AM"
      },
      %{
        slug: :slot_g,
        date: "Thursday, September 7, 2018",
        time: "8:50 AM - 9:05 AM"
      },
      %{
        slug: :slot_h,
        date: "Thursday, September 7, 2018",
        time: "9:05 AM - 10:05 AM"
      },
      %{
        slug: :slot_i,
        date: "Thursday, September 7, 2018",
        time: "10:05 AM - 10:35 AM"
      },
      %{
        slug: :slot_j,
        date: "Thursday, September 7, 2018",
        time: "10:35 AM - 11:15 AM"
      },
      %{
        slug: :slot_k,
        date: "Thursday, September 7, 2018",
        time: "11:20 AM - 12:00 PM"
      },
      %{
        slug: :slot_l,
        date: "Thursday, September 7, 2018",
        time: "12:00 PM - 1:30 PM"
      },
      %{
        slug: :slot_m,
        date: "Thursday, September 7, 2018",
        time: "1:30 PM - 2:10 PM"
      },
      %{
        slug: :slot_n,
        date: "Thursday, September 7, 2018",
        time: "2:15 PM - 2:55 PM"
      },
      %{
        slug: :slot_o,
        date: "Thursday, September 7, 2018",
        time: "2:55 PM - 3:30 PM"
      },
      %{
        slug: :slot_p,
        date: "Thursday, September 7, 2018",
        time: "3:30 PM - 4:10 PM"
      },
      %{
        slug: :slot_q,
        date: "Thursday, September 7, 2018",
        time: "4:15 PM - 4:55 PM"
      },
      %{
        slug: :slot_r,
        date: "Thursday, September 7, 2018",
        time: "4:55 PM - 5:15 PM"
      },
      %{
        slug: :slot_s,
        date: "Thursday, September 7, 2018",
        time: "5:15 PM - 5:30 PM"
      },
      %{
        slug: :slot_t,
        date: "Thursday, September 7, 2018",
        time: "5:30 PM - 6:30 PM"
      }
    ]
  end
end

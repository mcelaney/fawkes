defmodule FawkesWeb.ScheduleController do
  use FawkesWeb, :controller
  alias Fawkes.Schedule
  alias Fawkes.Profile
  alias FawkesWeb.TalkView

  def index(conn, _params) do
    schedule = Schedule.fetch()

    render(conn, "index.html", schedules: group_schedule_by_dates(schedule),
                               talk_counts: talk_counts(schedule),
                               agenda_item_slugs: talk_slug_mapset(conn))
  end

  def show(conn, %{"id" => slug}) do
    schedule = slug |> Schedule.fetch() |> List.wrap() |> IO.inspect

    render(conn, "index.html", schedules: group_schedule_by_dates(schedule),
                               talk_counts: talk_counts(schedule),
                               agenda_item_slugs: talk_slug_mapset(conn))
  end
end

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
    render(conn, TalkView, "index.html", talks: nil)
  end

  defp talk_counts(schedule) do
    schedule
    |> Schedule.to_talk_ids()
    |> Profile.fetch_attendance_counts()
  end
end

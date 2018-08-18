defmodule FawkesWeb.CategoryController do
  use FawkesWeb, :controller
  alias Fawkes.Schedule

  def show(conn, %{"id" => id}) do
    schedule = Schedule.fetch_by_category(id)

    render(conn, FawkesWeb.ScheduleView, "index.html",
                 schedules: group_schedule_by_dates(schedule),
                 talk_counts: talk_counts(schedule),
                 agenda_item_slugs: talk_slug_mapset(conn))
  end
end

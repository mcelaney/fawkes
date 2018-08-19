defmodule FawkesWeb.AudienceController do
  use FawkesWeb, :controller

  def show(conn, %{"id" => id}) do
    schedule = Schedule.fetch_by_audience(id)

    render(conn, FawkesWeb.ScheduleView, "index.html",
                 schedules: group_schedule_by_dates(schedule),
                 talk_counts: talk_counts(schedule),
                 agenda_item_slugs: talk_slug_mapset(conn))
  end
end

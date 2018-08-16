defmodule FawkesWeb.AudienceController do
  use FawkesWeb, :controller
  alias Fawkes.Schedule

  def show(conn, %{"id" => id}) do
    render(conn, FawkesWeb.ScheduleView,
                 "index.html",
                 schedules: Schedule.fetch_by_audience(id))
  end
end

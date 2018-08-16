defmodule FawkesWeb.ScheduleController do
  use FawkesWeb, :controller
  alias Fawkes.Schedule

  def index(conn, _params) do
    render(conn, "index.html", schedules: Schedule.fetch())
  end
end

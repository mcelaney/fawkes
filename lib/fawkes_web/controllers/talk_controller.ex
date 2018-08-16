defmodule FawkesWeb.TalkController do
  use FawkesWeb, :controller
  alias Fawkes.Schedule

  def show(conn, %{"id" => slug}) do
    render(conn, "show.html", talk: Schedule.fetch_talks(slug))
  end
end

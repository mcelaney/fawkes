defmodule FawkesWeb.SpeakerController do
  use FawkesWeb, :controller
  alias Fawkes.Schedule

  def show(conn, %{"id" => id}) do
    render(conn, FawkesWeb.SpeakerView,
                 "index.html",
                 schedules: Schedule.fetch_speakers())
  end
end

defmodule FawkesWeb.ScheduleView do
  use FawkesWeb, :view

  def render("index.html", %{schedules: schedules, conn: conn}) do
    schedules
    |> group_schedule_by_dates()
    |> Enum.map(fn({date, slots}) ->
         render(__MODULE__, "date.html", %{date: date, slots: slots, conn: conn})
       end)
  end

  def render_slot(_, %{event: event, time: time}) when not is_nil event do
    render(__MODULE__, "event.html", time: time, event: event)
  end

  def render_slot(conn, %{talks: talks, time: time}) do
    render(__MODULE__, "talks.html", time: time, talks: talks, conn: conn)
  end

  defp group_schedule_by_dates(slots) do
    Enum.group_by(slots, fn(slot) -> slot.date end)
  end
end

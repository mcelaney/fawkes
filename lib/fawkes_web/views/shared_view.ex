defmodule FawkesWeb.SharedView do
  use FawkesWeb, :view
  alias Fawkes.Auth
  alias Fawkes.Auth.User
  alias FawkesWeb.SharedView

  def render_timespan(%{start: _, finish: _} = slot_info) do
    SharedView.render("time_span.html", _display_time_params(slot_info))
  end

  defp _display_time_params(%{start: start, finish: finish}) do
    %{
      start_datetime: formal_datetime(start),
      start_time: display_time(start),
      finish_datetime: formal_datetime(finish),
      finish_time: display_time(finish)
    }
  end

  def display_time(time), do: Timex.format!(time, "%l:%M %P", :strftime)

  defp formal_datetime(date) do
    Timex.format!(date, "%Y-%m-%dT%H:%M", :strftime)
  end

  def user_auth_changeset do
    Auth.change_user(%User{})
  end
end

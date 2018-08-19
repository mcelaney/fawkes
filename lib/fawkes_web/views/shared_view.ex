defmodule FawkesWeb.SharedView do
  use FawkesWeb, :view
  alias Fawkes.Auth
  alias Fawkes.Auth.User
  alias Fawkes.Schedule.Slot
  alias FawkesWeb.SharedView

  @spec render_timespan(Slot.t()) :: map
  @spec display_time(NaiveDateTime.t()) :: String.t()
  @spec user_auth_changeset() :: Ecto.Changeset.t()

  @doc """
  Given a slot returns a Slot.t returns a map of formatted date content
  """
  def render_timespan(%Slot{start: _, finish: _} = slot_info) do
    SharedView.render("time_span.html", _display_time_params(slot_info))
  end

  @doc """
  Given a datetime feturns the formatted time
  """
  def display_time(time), do: Timex.format!(time, "%l:%M %P", :strftime)

  @doc """
  Returns an empty changeset for Fawkes.Auth.User
  """
  def user_auth_changeset do
    Auth.change_user(%User{})
  end

  @spec _display_time_params(Slot.t()) :: map
  defp _display_time_params(%Slot{start: start, finish: finish}) do
    %{
      start_datetime: formal_datetime(start),
      start_time: display_time(start),
      finish_datetime: formal_datetime(finish),
      finish_time: display_time(finish)
    }
  end

  @spec formal_datetime(NaiveDateTime.t()) :: String.t()
  defp formal_datetime(date) do
    Timex.format!(date, "%Y-%m-%dT%H:%M", :strftime)
  end
end

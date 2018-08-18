defmodule FawkesWeb.ScheduleView do
  use FawkesWeb, :view
  alias Fawkes.Profile
  alias FawkesWeb.SharedView

  def render_slot(slot, assigns) do
    cond do
      slot.none_selected? ->
        FawkesWeb.ScheduleView.render("selection_needed.html", assigns)
      talks_exist?(slot) ->
        render(FawkesWeb.ScheduleView, "talks.html", assigns)
      not is_nil(slot.event) ->
        render(FawkesWeb.ScheduleView, "event.html", assigns)
    end
  end

  def agenda_item_changeset do
    Profile.agenda_item_changeset()
  end

  defp talks_exist?(%{talks: [_|_]}), do: true
  defp talks_exist?(_), do: false
end

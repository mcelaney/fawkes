defmodule FawkesWeb.ProfileController do
  use FawkesWeb, :controller

  alias Fawkes.Profile
  alias Fawkes.Schedule

  def index(conn, _) do
    render(conn, "index.html", profiles: Profile.fetch_user_profiles())
  end

  def show(conn, %{"id" => slug}) do
    profile = Profile.fetch_user_profile(slug)
    schedule =
      profile.agenda_items
      |> Enum.map(fn(%{talk_id: id}) -> id end)
      |> Schedule.fetch_for_talks()

    render(conn, "show.html",
                 user: profile,
                 schedules: group_schedule_by_dates(schedule),
                 talk_counts: talk_counts(schedule),
                 agenda_item_slugs: talk_slug_mapset(conn))
  end

  def edit(conn, _params) do
    render(conn, "edit.html", changeset: current_profile_changeset(conn))
  end

  def update(conn, %{"info" => params}) do
    case Profile.update_info(conn.assigns.current_user, params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: page_path(conn, :timeline))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

  defp current_profile_changeset(conn) do
    conn.assigns.current_user
    |> Profile.fetch_or_create_for_user(Schedule.single_talk_slot_talk_ids())
    |> Profile.info_changeset()
  end
end

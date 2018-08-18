defmodule FawkesWeb.ProfileController do
  use FawkesWeb, :controller

  alias Fawkes.Profile
  alias Fawkes.Schedule

  def show(conn, %{"id" => slug}) do
    render(conn, "show.html", user: Profile.fetch_user_profile(slug))
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

defmodule FawkesWeb.ProfileController do
  use FawkesWeb, :controller

  alias Fawkes.Profile
  alias Fawkes.Auth.Guardian.Plug, as: GuardianPlug

  def show(conn, %{"id" => slug}) do
    render(conn, "show.html", user: Profile.fetch_user_profile(slug))
  end

  def edit(conn, _params) do
    render(conn, "edit.html", changeset: current_profile_changeset(conn))
  end

  def update(conn, %{"info" => params}) do
    case conn |> GuardianPlug.current_resource() |> Profile.update_info(params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: page_path(conn, :timeline))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

  defp current_profile_changeset(conn) do
    conn
    |> GuardianPlug.current_resource()
    |> Profile.fetch_or_create_for_user()
    |> Profile.info_changeset()
  end
end

defmodule FawkesWeb.PageController do
  use FawkesWeb, :controller
  alias Fawkes.Auth
  alias Fawkes.Auth.Guardian
  alias Guardian.Plug, as: GuardianPlug

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def login(conn, %{"user" => %{"username" => username, "password" => pass}}) do
    with {:ok, user} <- Auth.authenticate_user(username, pass) do
      conn
      |> put_flash(:success, gettext("Welcome back!"))
      |> GuardianPlug.sign_in(user)
      |> redirect(to: schedule_path(conn, :index))
    else
      {:error, :incorrect} ->
        conn
        |> put_flash(:error, gettext("Your username or password are incorrect."))
        |> redirect(to: "/")
    end
  end

  def logout(conn, _) do
    conn
    |> GuardianPlug.sign_out()
    |> redirect(to: page_path(conn, :index))
  end
end

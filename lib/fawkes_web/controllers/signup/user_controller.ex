defmodule FawkesWeb.Signup.UserController do
  use FawkesWeb, :controller

  alias Ecto.Changeset
  alias Fawkes.Auth.Guardian.Plug, as: GuardianPlug
  alias Fawkes.Signup
  alias Fawkes.Signup.User
  alias Plug.Conn

  def new(conn, _params) do
    conn.assigns.current_user
    |> is_nil()
    |> case do
         true -> conn
         _ -> GuardianPlug.sign_out(conn)
       end
    |> Conn.assign(:ignore_login, true)
    |> render("new.html", changeset: Signup.change_user(%User{}),
                          maybe_user: nil)
  end

  def create(conn, %{"user" => user_params}) do
    case Signup.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> GuardianPlug.sign_in(user)
        |> redirect(to: page_path(conn, :timeline))
      {:error, %Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end

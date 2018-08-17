defmodule FawkesWeb.Signup.UserController do
  use FawkesWeb, :controller

  alias Fawkes.Signup
  alias Fawkes.Signup.User
  alias Fawkes.Auth.Guardian.Plug, as: GuardianPlug

  def new(conn, _params) do
    conn
    |> GuardianPlug.current_resource()
    |> is_nil()
    |> case do
         true -> conn
         _ -> GuardianPlug.sign_out(conn)
       end
    |> Plug.Conn.assign(:ignore_login, true)
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
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end

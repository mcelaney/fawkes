defmodule FawkesWeb.PageControllerTest do
  use FawkesWeb.ConnCase
  alias Fawkes.Signup

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Fawkes"
  end

  describe "login" do
    @valid_username "Mac"
    @valid_password "Strong Password"
    @invalid_password "nope"
    @login_attrs %{username: @valid_username, password: @valid_password}
    @bad_login_attrs %{username: @valid_username, password: @invalid_password}

    setup %{conn: conn} do
      {:ok, user} =
        %{username: @valid_username, password: @valid_password}
        |> Signup.create_user()

      [user: user, conn: conn]
    end

    test "POST /login with invalid params", %{conn: conn} do
      conn = post conn, page_path(conn, :login), user: @bad_login_attrs
      assert redirected_to(conn) == page_path(conn, :index)

      conn = get conn, "/"
      assert html_response(conn, 200) =~ "Get Started"
    end
  end

  describe "logout" do
    setup %{conn: conn} do
      {:ok, user} =
        %{username: @valid_username, password: @valid_password}
        |> Signup.create_user()

      conn = post conn, page_path(conn, :login), user: @login_attrs

      [user: user, conn: conn]
    end
  end
end

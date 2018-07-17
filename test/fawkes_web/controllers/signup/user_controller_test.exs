defmodule FawkesWeb.Signup.UserControllerTest do
  use FawkesWeb.ConnCase

  @create_attrs %{username: "Mac", password: "Strong Password"}
  @invalid_attrs %{username: "Mac", password: nil}

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get conn, signup_user_path(conn, :new)
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "create user" do
    test "redirects to timeline when data is valid", %{conn: conn} do
      conn = post conn, signup_user_path(conn, :create), user: @create_attrs

      assert %{} = redirected_params(conn)
      assert redirected_to(conn) == page_path(conn, :timeline)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, signup_user_path(conn, :create), user: @invalid_attrs
      assert html_response(conn, 200) =~ "New User"
    end
  end
end

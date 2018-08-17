defmodule Fawkes.ProfileTest do
  use Fawkes.DataCase

  alias Fawkes.Profile
  alias Fawkes.Signup
  alias Fawkes.Profile.User

  @valid_username "Mac"
  @valid_password "Strong Password"

  describe "Given a valid user" do
    setup do
      {:ok, user} =
        %{username: @valid_username, password: @valid_password}
        |> Signup.create_user()

      [user: user]
    end

    test "get_user/1 fetches an existing user", %{user: user} do
      result = Profile.get_user(user.id)

      assert result.id == user.id
      assert %User{} = result
    end

    test "get_user/1 returns an error tuple", %{user: user} do
      result = Profile.get_user(user.id + 1)

      assert result == nil
    end
  end
end

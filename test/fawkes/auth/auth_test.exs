defmodule Fawkes.AuthTest do
  use Fawkes.DataCase

  alias Fawkes.Auth
  alias Fawkes.Signup
  alias Fawkes.Auth.User

  @valid_username "Mac"
  @invalid_username "NotMac"
  @valid_password "Strong Password"
  @invalid_password "Incorrect Password"

  describe "Given a valid user" do
    setup do
      {:ok, user} =
        %{username: @valid_username, password: @valid_password}
        |> Signup.create_user()

      [user: user]
    end

    test "authenticate_user/3 accepts valid credentials", %{user: user} do
      {:ok, result} = Auth.authenticate_user(@valid_username, @valid_password)

      assert result.id == user.id
    end

    test "authenticate_user/3 rejects invalid password" do
      result = Auth.authenticate_user(@valid_username, @invalid_password)

      assert result == {:error, :incorrect}
    end

    test "authenticate_user/3 rejects invalid username" do
      result = Auth.authenticate_user(@invalid_username, @valid_password)

      assert result == {:error, :incorrect}
    end
  end

  test "change_user/1 returns a user changeset" do
    assert %Ecto.Changeset{} = Auth.change_user(%User{})
  end
end

defmodule Fawkes.Auth.GuardianTest do
  use Fawkes.DataCase
  alias Fawkes.Auth.User, as: AuthUser
  alias Fawkes.Signup
  alias Fawkes.Signup.User, as: SignupUser
  alias Fawkes.Auth.Guardian

  @valid_username "Mac"
  @valid_password "Strong Password"

  test "subject_for_token/2 for Auth" do
    assert Guardian.subject_for_token(%AuthUser{id: 1}, nil) == {:ok, "1"}
  end

  test "subject_for_token/2 for Signup" do
    assert Guardian.subject_for_token(%SignupUser{id: 1}, nil) == {:ok, "1"}
  end

  describe "Given a valid user" do
    setup do
      {:ok, user} =
        %{username: @valid_username, password: @valid_password}
        |> Signup.create_user()

      [user: user]
    end

    test "resource_from_claims/1 finds a user", %{user: user} do
      {:ok, result} = Guardian.resource_from_claims(%{"sub" => user.id})

      assert result.id == user.id
    end

    test "resource_from_claims/1 handles a missing user", %{user: user} do
      result = Guardian.resource_from_claims(%{"sub" => user.id + 1})

      assert result == {:error, :resource_not_found}
    end
  end
end

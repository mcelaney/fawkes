defmodule Fawkes.RepoTest do
  use Fawkes.DataCase
  alias Fawkes.Repo
  alias Fawkes.Signup
  alias Fawkes.Profile.User

  @valid_username "Mac"
  @valid_password "Strong Password"

  describe "given a record exists" do
    setup do
      {:ok, user} =
        %{username: @valid_username, password: @valid_password}
        |> Signup.create_user()

      [user_id: user.id]
    end

    test "fetch/2 returns an :ok tagged tuple", %{user_id: id} do
      {:ok, result} = Repo.fetch(User, id)
      assert result.username == @valid_username
    end

    test "fetch/2 returns a :not_found tagged tuple if not found",
         %{user_id: id} do
      result = Repo.fetch(User, id + 1)

      assert result == {:error, :not_found}
    end

    test "fetch_by/2 returns an :ok tagged tuple", %{user_id: id} do
      {:ok, result} = Repo.fetch_by(User, username: @valid_username)
      assert id == result.id
    end

    test "fetch_by/2 returns a :not_found tagged tuple if not found" do
      {:not_found, result} =
        Repo.fetch_by(User, username: @valid_username <> "a")

      assert result == User
    end
  end
end

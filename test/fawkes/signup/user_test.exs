defmodule Fawkes.Signup.UserTest do
  use Fawkes.DataCase
  alias Fawkes.Signup
  alias Fawkes.Signup.User
  alias Comeonin.Bcrypt

  @valid_username "Mac"
  @valid_password "Strong Password"

  test "registration_changeset/2 rejects easy passwords" do
    params = %{"username" => @valid_username, "password" => "12345678"}
    change = User.registration_changeset(%User{}, params)

    assert %Ecto.Changeset{valid?: false} = change
  end

  test "registration_changeset/2 rejects short passwords" do
    params = %{"username" => @valid_username, "password" => "short"}
    change = User.registration_changeset(%User{}, params)

    assert %Ecto.Changeset{valid?: false} = change
  end

  test "registration_changeset/2 hashes passwords" do
    params = %{"username" => @valid_username, "password" => @valid_password}
    user = %User{} |> User.registration_changeset(params) |> apply_changes()

    assert Bcrypt.checkpw(@valid_password, user.password) == true
  end

  describe "Given a valid user" do
    setup do
      {:ok, user} =
        %{username: @valid_username, password: @valid_password}
        |> Signup.create_user()

      [user: user]
    end

    test "registration_changeset/2 rejects duplicate usernames" do
      params = %{"username" => @valid_username, "password" => @valid_password}
      {:error, change} =
        %User{} |> User.registration_changeset(params) |> Repo.insert()

      assert %Ecto.Changeset{valid?: false} = change
    end
  end
end

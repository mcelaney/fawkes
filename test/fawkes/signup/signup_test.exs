defmodule Fawkes.SignupTest do
  use Fawkes.DataCase
  alias Fawkes.Signup
  alias Fawkes.Signup.User

  @valid_username "Mac"
  @valid_password "Strong Password"
  @invalid_password "nope"

  test "create_user/3 accepts valid params" do
    params = %{"username" => @valid_username, "password" => @valid_password}
    {:ok, result} = Signup.create_user(params)

    refute is_nil result.id
    assert %User{} = result
    assert result.username == @valid_username
  end

  test "create_user/3 rejects invalid params" do
    params = %{"username" => @valid_username, "password" => @invalid_password}
    {result, change} = Signup.create_user(params)

    assert result == :error
    assert %Ecto.Changeset{} = change
  end

  test "change_user/1 returns a user changeset" do
    assert %Ecto.Changeset{} = Signup.change_user(%User{})
  end
end

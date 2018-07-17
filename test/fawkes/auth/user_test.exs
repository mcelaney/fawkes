defmodule Fawkes.Auth.UserTest do
  use Fawkes.DataCase

  alias Fawkes.Auth.User

  test "change_user/1 returns a user changeset" do
    assert %Ecto.Changeset{} = User.changeset(%User{}, %{})
  end
end

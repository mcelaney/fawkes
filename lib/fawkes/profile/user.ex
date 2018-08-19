defmodule Fawkes.Profile.User do
  @moduledoc """
  Represents a Fawkes.Auth.User in the Fawkes.Profile context
  """

  use Ecto.Schema

  @type t :: %__MODULE__{}

  schema "users" do
    field(:username, :string)

    has_one(:profile, Fawkes.Profile.Info)

    timestamps()
  end
end

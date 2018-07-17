defmodule Fawkes.Profile.User do
  @moduledoc false

  use Ecto.Schema

  @type t :: %__MODULE__{}

  schema "users" do
    field :username, :string

    timestamps()
  end
end

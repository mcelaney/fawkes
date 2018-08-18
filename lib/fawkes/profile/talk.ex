defmodule Fawkes.Profile.Talk do
  use Ecto.Schema
  alias Fawkes.Repo.Symbol, as: SymbolType

  @type t :: %__MODULE__{}

  schema "talks" do
    field :slug, SymbolType
  end
end

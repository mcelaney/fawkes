defmodule Fawkes.Profile.Talk do
  @moduledoc """
  Represents a Fawkes.Schedule.Talk in the Fawkes.Profile context
  """

  use Ecto.Schema
  alias Fawkes.Repo.Symbol, as: SymbolType

  @type t :: %__MODULE__{}

  schema "talks" do
    field(:slug, SymbolType)
  end
end

defmodule Fawkes.Schedule.Slot do
  use Ecto.Schema
  import Ecto.Changeset
  alias Fawkes.Repo.Symbol, as: SymbolType

  schema "schedule_slots" do
    field :date, :string
    field :slug, SymbolType
    field :time, :string

    timestamps()
  end

  @doc false
  def changeset(slot, attrs) do
    slot
    |> cast(attrs, [:slug, :date, :time])
    |> validate_required([:slug, :date, :time])
    |> unique_constraint(:slug)
  end
end

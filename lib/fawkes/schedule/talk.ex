defmodule Fawkes.Schedule.Talk do
  use Ecto.Schema
  import Ecto.Changeset
  alias Fawkes.Repo.Symbol, as: SymbolType
  alias Fawkes.Schedule.Slot
  alias Fawkes.Schedule.Speaker
  alias Fawkes.Schedule.Category
  alias Fawkes.Schedule.Audience
  alias Fawkes.Schedule.Location

  schema "talks" do
    field :description, :string
    field :slug, SymbolType
    field :title, :string

    belongs_to :slot, Slot
    belongs_to :speaker, Speaker, foreign_key: :profile_id
    belongs_to :category, Category
    belongs_to :audience, Audience
    belongs_to :location, Location

    timestamps()
  end

  @doc false
  def changeset(talk, attrs) do
    talk
    |> cast(attrs, [:slug, :title, :description])
    |> validate_required([:slug, :title, :description])
    |> unique_constraint(:slug)
    |> assoc_constraint(:slot)
    |> assoc_constraint(:speaker)
    |> assoc_constraint(:category)
    |> assoc_constraint(:audience)
    |> assoc_constraint(:location)
  end
end

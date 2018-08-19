defmodule Fawkes.Profile.AgendaItem do
  @moduledoc """
  Talks a user has added to their agenda
  """

  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @spec changeset(t, map) :: Changeset.t()

  schema "profiles_talks" do
    belongs_to(:talk, Fawkes.Profile.Talk)
    belongs_to(:profile, Fawkes.Profile.Info)

    timestamps()
  end

  @doc false
  def changeset(agenda_item, attrs) do
    agenda_item
    |> cast(attrs, [:profile_id, :talk_id])
    |> validate_required([:profile_id, :talk_id])
    |> unique_constraint(:talk_id, name: :profiles_talks_profile_id_talk_id_index)
  end
end

defmodule Fawkes.Repo.Migrations.AddProfilesTalksTable do
  use Ecto.Migration

  def change do
    create table(:profiles_talks) do
      add :profile_id, references("profiles")
      add :talk_id, references("talks")

      timestamps()
    end

    create unique_index(:profiles_talks, [:profile_id, :talk_id])
  end
end

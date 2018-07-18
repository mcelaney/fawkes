defmodule Fawkes.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :slug, :string
      add :image, :string
      add :first, :string
      add :last, :string
      add :company, :string
      add :github, :string
      add :twitter, :string
      add :description, :text

      timestamps()
    end

    create unique_index(:profiles, [:slug])
  end
end

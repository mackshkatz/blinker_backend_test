defmodule BreedApi.Repo.Migrations.CreateFavorites do
  use Ecto.Migration

  def change do
    create table("favorites") do
      add :breed_id, references(:breeds), null: false

      timestamps()
    end
  end
end

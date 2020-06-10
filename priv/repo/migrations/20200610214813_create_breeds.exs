defmodule BreedApi.Repo.Migrations.CreateBreeds do
  use Ecto.Migration

  def change do
    create table("breeds") do
      add :name, :string, null: false
      add :description, :text, null: false
      add :country, :string, null: false
      add :images, {:array, :string}, null: false

      timestamps()
    end
  end
end

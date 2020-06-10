defmodule BreedApi.Favorite do
  use Ecto.Schema
  import Ecto.Changeset

  schema "favorites" do
    belongs_to :breed, BreedApi.Breed

    timestamps()
  end

  def changeset(favorite, attrs) do
    favorite
    |> cast(attrs, [:breed_id])
    |> validate_required([:breed_id])
    |> assoc_constraint(:breed)
  end
end

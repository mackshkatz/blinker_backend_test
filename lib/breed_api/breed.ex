defmodule BreedApi.Breed do
  use Ecto.Schema
  import Ecto.Changeset

  schema "breeds" do
    field :name, :string
    field :description, :string
    field :country, :string
    field :images, {:array, :string}

    timestamps()
  end

  def changeset(breed, attrs) do
    breed
    |> cast(attrs, [:name, :description, :country, :images])
    |> validate_required([:name, :description, :country, :images])
  end
end

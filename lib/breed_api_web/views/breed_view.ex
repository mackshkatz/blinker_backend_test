defmodule BreedApiWeb.BreedView do
  use BreedApiWeb, :view

  def render("index.json", %{breeds: breeds}) do
    Enum.map(breeds, fn breed ->
      %{
        id: breed.id,
        name: breed.name,
        description: breed.description,
        country: breed.country,
        images: breed.images
      }
    end)
  end

  def render("show.json", %{breed: breed}) do
    %{
      id: breed.id,
      name: breed.name,
      description: breed.description,
      country: breed.country,
      images: breed.images
    }
  end
end

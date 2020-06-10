defmodule BreedApiWeb.FavoriteView do
  use BreedApiWeb, :view

  def render("index.json", %{favorites: favorites}) do
    Enum.map(favorites, fn favorite ->
      %{
        id: favorite.id,
        breed: render_one(favorite.breed, BreedApiWeb.BreedView, "show.json", as: :breed)
      }
    end)
  end

  def render("show.json", %{favorite: favorite}) do
    %{
      id: favorite.id,
      breed: render_one(favorite.breed, BreedApiWeb.BreedView, "show.json", as: :breed)
    }
  end
end

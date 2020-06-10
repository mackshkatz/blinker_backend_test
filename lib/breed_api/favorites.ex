defmodule BreedApi.Favorites do
  alias BreedApi.{
    Repo,
    Favorite
  }

  def all() do
    Repo.all(Favorite)
  end

  def get(id) do
    Repo.get(Favorite, id)
  end

  def delete(id) do
    id
    |> get()
    |>  Repo.delete()
  end

  def create(attrs \\ %{}) do
    %Favorite{}
    |> Favorite.changeset(attrs)
    |> Repo.insert()
  end
end

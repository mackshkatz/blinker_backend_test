defmodule BreedApi.Favorites do
  import Ecto.Query

  alias BreedApi.{
    Repo,
    Favorite
  }

  def all() do
    from(
      f in Favorite,
      preload: :breed
    )
    |> Repo.all()
  end

  def get(id) do
    from(
      f in Favorite,
      where: f.id == ^id,
      preload: :breed
    )
    |> Repo.one()
  end

  def delete(id) do
    id
    |> get()
    |> Repo.delete()
  end

  def create(attrs \\ %{}) do
    %Favorite{}
    |> Favorite.changeset(attrs)
    |> Repo.insert()
  end
end

defmodule BreedApi.Breeds do
  alias BreedApi.{
    Repo,
    Breed
  }

  def all() do
    Repo.all(Breed)
  end

  def get(id) do
    Repo.get(Breed, id)
  end
end

defmodule BreedApiWeb.BreedController do
  use BreedApiWeb, :controller

  alias BreedApi.Breeds

  def index(conn, _params) do
    breeds = Breeds.all()

    render(conn, "index.json", breeds: breeds)
  end

  def show(conn, %{"id" => id}) do
    breed = Breeds.get(id)

    render(conn, "show.json", breed: breed)
  end
end

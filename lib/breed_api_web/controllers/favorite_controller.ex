defmodule BreedApiWeb.FavoriteController do
  use BreedApiWeb, :controller

  alias BreedApi.Favorites

  def index(conn, _params) do
    favorites = Favorites.all()

    render(conn, "index.json", favorites: favorites)
  end

  def show(conn, %{"id" => id}) do
    favorite = Favorites.get(id)

    render(conn, "show.json", favorite: favorite)
  end

  def create(conn, params) do
    Favorites.create(params)
    |> case do
      {:ok, _favorite} ->
        conn
        |> send_resp(204, "")

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> put_view(BreedApiWeb.ErrorView)
        |> render("error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    {:ok, _favorite} = Favorites.delete(id)

    conn
    |> send_resp(204, "")
  end
end

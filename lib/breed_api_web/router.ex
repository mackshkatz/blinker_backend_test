defmodule BreedApiWeb.Router do
  use BreedApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BreedApiWeb do
    pipe_through :api

    resources("/breeds", BreedController, only: [:index, :show])
    resources("/favorites", FavoriteController, only: [:index, :show, :delete])
    post("/favorites/add", FavoriteController, :create)
  end
end

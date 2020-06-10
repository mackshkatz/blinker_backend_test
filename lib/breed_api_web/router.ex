defmodule BreedApiWeb.Router do
  use BreedApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BreedApiWeb do
    pipe_through :api
  end
end

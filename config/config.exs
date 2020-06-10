# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :breed_api,
  ecto_repos: [BreedApi.Repo]

# Configures the endpoint
config :breed_api, BreedApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yQcV95f5I3xyrkvog/O6RzK1uGhtnTvlZbVHk3WlV7BQZ+Cv8fJ+0i7y9daOmKch",
  render_errors: [view: BreedApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: BreedApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

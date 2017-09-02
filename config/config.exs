# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :workshop,
  ecto_repos: [Workshop.Repo]

# Configures the endpoint
config :workshop, WorkshopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HEwmM32DYqlyhyn8aROpXHNj2AFcxm66C+J7gcBVU7VcoTmvrKf2FjR1fnAP7LPA",
  render_errors: [view: WorkshopWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Workshop.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

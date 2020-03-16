# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_auto_save,
  ecto_repos: [PhoenixAutoSave.Repo]

# Configures the endpoint
config :phoenix_auto_save, PhoenixAutoSaveWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZtlKBuH5weon1Ic0AdGZlYSPcQigivrAC9/Bq9JyxFsvH7VMRtrxAUo9EiPBInM5",
  render_errors: [view: PhoenixAutoSaveWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixAutoSave.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "CjOUihuEulErfiDeBsqrJ3MKyiw/iW7A"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

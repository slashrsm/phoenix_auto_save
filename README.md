# PhoenixAutoSave

This is a demo project that showcases real-time auto save with [Phoenix LiveView](https://hex.pm/packages/phoenix_live_view). 

Also see the [blog post](https://janezurevc.name/real-time-auto-save-phoenix-liveview).

To start:

  * Install dependencies with `mix deps.get`
  * Run Postgres using Docker with `docker-compose up -d` or update      [config/dev.exs](config/dev.exs) if you are running it some other way.
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

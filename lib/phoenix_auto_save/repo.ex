defmodule PhoenixAutoSave.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_auto_save,
    adapter: Ecto.Adapters.Postgres
end

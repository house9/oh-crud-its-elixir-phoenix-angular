use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :server, OhCrud.Endpoint,
  secret_key_base: "7/TffPnXVv+NZaAQn4Sak8XXjfeQiiSy/B2sZJlgS7oWw6fp64JKs6eLKbDrCcgR"

# Configure your database
config :server, OhCrud.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "server_prod"

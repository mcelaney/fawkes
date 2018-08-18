use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fawkes, FawkesWeb.Endpoint,
  http: [port: 4001],
  server: false,
  secret_key_base: "WC0qCl+1UbVYfCivgI23gKrHGEBy/i08b4uzifPAO/cPIlPv7O0szgqAuMCaAeoI"

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :fawkes, Fawkes.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "fawkes_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :fawkes, Fawkes.Auth.Guardian,
       issuer: "fawkes",
       secret_key: "akey"

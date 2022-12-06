defmodule PhAuthApi.Repo do
  use Ecto.Repo,
    otp_app: :ph_auth_api,
    adapter: Ecto.Adapters.Postgres
end

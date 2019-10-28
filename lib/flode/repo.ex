defmodule Flode.Repo do
  use Ecto.Repo,
    otp_app: :flode,
    adapter: Ecto.Adapters.Postgres
end

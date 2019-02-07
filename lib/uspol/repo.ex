defmodule Uspol.Repo do
  use Ecto.Repo,
    otp_app: :uspol,
    adapter: Ecto.Adapters.Postgres
end

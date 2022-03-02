defmodule Vestemais.Repo do
  use Ecto.Repo,
    otp_app: :vestemais,
    adapter: Ecto.Adapters.Postgres
end

defmodule FacilitaCase.Repo do
  use Ecto.Repo,
    otp_app: :facilita_case,
    adapter: Ecto.Adapters.Postgres
end

defmodule VetPal.Repo do
  use Ecto.Repo,
    otp_app: :vet_pal,
    adapter: Ecto.Adapters.MyXQL
end

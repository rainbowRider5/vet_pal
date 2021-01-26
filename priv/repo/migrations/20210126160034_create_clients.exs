defmodule VetPal.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :address, :string
      add :city, :string
      add :first_name, :string
      add :last_name, :string

      timestamps()
    end

  end
end

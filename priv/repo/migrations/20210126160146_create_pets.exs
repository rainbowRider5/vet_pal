defmodule VetPal.Repo.Migrations.CreatePets do
  use Ecto.Migration

  def change do
    create table(:pets) do
      add :breed, :string
      add :name, :string
      add :type, :string
      add :client_id, references(:clients, on_delete: :nothing)

      timestamps()
    end

    create index(:pets, [:client_id])
  end
end

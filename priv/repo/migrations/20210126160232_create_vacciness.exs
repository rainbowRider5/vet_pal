defmodule VetPal.Repo.Migrations.CreateVacciness do
  use Ecto.Migration

  def change do
    create table(:vacciness) do
      add :manufacturer, :string
      add :name, :string
      add :pet_id, references(:pets, on_delete: :nothing)

      timestamps()
    end

    create index(:vacciness, [:pet_id])
  end
end

defmodule VetPal.Pets.Pet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pets" do
    field :breed, :string
    field :name, :string
    field :type, :string

    has_many :vaccines, VetPal.Vacciness.Vaccine
    belongs_to :client, VetPal.Clients.Client, foreign_key: :client_id
    timestamps()
  end

  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:breed, :name, :type, :client_id])
    |> validate_required([:breed, :name, :type, :client_id])
  end
end

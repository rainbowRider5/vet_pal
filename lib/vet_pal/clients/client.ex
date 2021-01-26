defmodule VetPal.Clients.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field :address, :string
    field :city, :string
    field :first_name, :string
    field :last_name, :string

    has_many :pets, VetPal.Pets.Pet
    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:address, :city, :first_name, :last_name])
    |> validate_required([:address, :city, :first_name, :last_name])
  end
end

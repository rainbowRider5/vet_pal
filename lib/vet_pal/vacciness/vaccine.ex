defmodule VetPal.Vacciness.Vaccine do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vacciness" do
    field :manufacturer, :string
    field :name, :string

    belongs_to :pet, VetPal.Pets.Pet, foreign_key: :pet_id
    timestamps()
  end

  @doc false
  def changeset(vaccine, attrs) do
    vaccine
    |> cast(attrs, [:manufacturer, :name, :pet_id])
    |> validate_required([:manufacturer, :name, :pet_id])
  end
end

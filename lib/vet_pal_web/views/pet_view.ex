defmodule VetPalWeb.PetView do
  use VetPalWeb, :view
  alias VetPal.Clients
  alias VetPal.Pets.Pet
  alias VetPal.Pets
  def list_clients do
    Clients.list_clients()
  end

  def get_owner(%Pet{} = pet, opts) do
    if pet.client_id do
      owner = Pets.get_owner(pet.client_id)
      case {opts} do
        {"full"} -> owner
        {"id"} -> owner.id
        {"name"} -> "#{owner.first_name} #{owner.last_name}"
        {"full_string"} -> "#{owner.first_name} #{owner.last_name}, #{owner.city}, #{owner.address}"
      end
    else
      ""
    end
  end

  def get_vaccines(%Pet{} = pet) do
    Pets.get_vaccines(pet.id)
  end
end

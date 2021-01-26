defmodule VetPalWeb.VaccineView do
  use VetPalWeb, :view
  alias VetPal.Pets
  alias VetPal.Vacciness
  alias VetPal.Vacciness.Vaccine
   def list_pets do
    Pets.list_pets()
  end

  defp list_vaccines do
    Vacciness.list_vacciness()
  end

  def get_vaccinated_pet(%Vaccine{} = vaccine, opts) do
    if vaccine.pet_id do
      pet = Vacciness.get_vaccinated_pet(vaccine.pet_id)
      case {opts} do
        {"full"} -> pet
        {"id"} -> pet.id
        {"name"} -> "#{pet.name}"
        {"full_string"} -> "#{pet.name}, #{pet.type}, #{pet.breed}"
      end
    else
      ""
    end
  end
end

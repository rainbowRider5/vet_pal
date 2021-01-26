defmodule VetPalWeb.PetController do
  use VetPalWeb, :controller

  alias VetPal.Pets
  alias VetPal.Pets.Pet

  def index(conn, _params) do
    pets = Pets.list_pets()
    render(conn, "index.html", pets: pets)
  end

  def new(conn, _params) do
    changeset = Pets.change_pet(%Pet{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pet" => pet_params}) do
    case Pets.create_pet(pet_params) do
      {:ok, pet} ->
        conn
        |> put_flash(:info, "Pet created successfully.")
        |> redirect(to: Routes.pet_path(conn, :show, pet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pet = Pets.get_pet!(id)
    render(conn, "show.html", pet: pet)
  end

  def edit(conn, %{"id" => id}) do
    pet = Pets.get_pet!(id)
    changeset = Pets.change_pet(pet)
    render(conn, "edit.html", pet: pet, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pet" => pet_params}) do
    pet = Pets.get_pet!(id)

    case Pets.update_pet(pet, pet_params) do
      {:ok, pet} ->
        conn
        |> put_flash(:info, "Pet updated successfully.")
        |> redirect(to: Routes.pet_path(conn, :show, pet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pet: pet, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pet = Pets.get_pet!(id)
    {:ok, _pet} = Pets.delete_pet(pet)

    conn
    |> put_flash(:info, "Pet deleted successfully.")
    |> redirect(to: Routes.pet_path(conn, :index))
  end
end

defmodule VetPalWeb.VaccineController do
  use VetPalWeb, :controller

  alias VetPal.Vacciness
  alias VetPal.Vacciness.Vaccine

  def index(conn, _params) do
    vacciness = Vacciness.list_vacciness()
    render(conn, "index.html", vacciness: vacciness)
  end

  def new(conn, _params) do
    changeset = Vacciness.change_vaccine(%Vaccine{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"vaccine" => vaccine_params}) do
    case Vacciness.create_vaccine(vaccine_params) do
      {:ok, vaccine} ->
        conn
        |> put_flash(:info, "Vaccine created successfully.")
        |> redirect(to: Routes.vaccine_path(conn, :show, vaccine))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    vaccine = Vacciness.get_vaccine!(id)
    render(conn, "show.html", vaccine: vaccine)
  end

  def edit(conn, %{"id" => id}) do
    vaccine = Vacciness.get_vaccine!(id)
    changeset = Vacciness.change_vaccine(vaccine)
    render(conn, "edit.html", vaccine: vaccine, changeset: changeset)
  end

  def update(conn, %{"id" => id, "vaccine" => vaccine_params}) do
    vaccine = Vacciness.get_vaccine!(id)

    case Vacciness.update_vaccine(vaccine, vaccine_params) do
      {:ok, vaccine} ->
        conn
        |> put_flash(:info, "Vaccine updated successfully.")
        |> redirect(to: Routes.vaccine_path(conn, :show, vaccine))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", vaccine: vaccine, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vaccine = Vacciness.get_vaccine!(id)
    {:ok, _vaccine} = Vacciness.delete_vaccine(vaccine)

    conn
    |> put_flash(:info, "Vaccine deleted successfully.")
    |> redirect(to: Routes.vaccine_path(conn, :index))
  end
end

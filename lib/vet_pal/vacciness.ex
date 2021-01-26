defmodule VetPal.Vacciness do
  @moduledoc """
  The Vacciness context.
  """

  import Ecto.Query, warn: false
  alias VetPal.Repo

  alias VetPal.Vacciness.Vaccine
  alias VetPal.Pets.Pet
  @doc """
  Returns the list of vacciness.

  ## Examples

      iex> list_vacciness()
      [%Vaccine{}, ...]

  """
  def list_vacciness do
    Repo.all(Vaccine)
  end

  @doc """
  Gets a single vaccine.

  Raises `Ecto.NoResultsError` if the Vaccine does not exist.

  ## Examples

      iex> get_vaccine!(123)
      %Vaccine{}

      iex> get_vaccine!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vaccine!(id), do: Repo.get!(Vaccine, id)

  @doc """
  Creates a vaccine.

  ## Examples

      iex> create_vaccine(%{field: value})
      {:ok, %Vaccine{}}

      iex> create_vaccine(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vaccine(attrs \\ %{}) do
    %Vaccine{}
    |> Vaccine.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vaccine.

  ## Examples

      iex> update_vaccine(vaccine, %{field: new_value})
      {:ok, %Vaccine{}}

      iex> update_vaccine(vaccine, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vaccine(%Vaccine{} = vaccine, attrs) do
    vaccine
    |> Vaccine.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a vaccine.

  ## Examples

      iex> delete_vaccine(vaccine)
      {:ok, %Vaccine{}}

      iex> delete_vaccine(vaccine)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vaccine(%Vaccine{} = vaccine) do
    Repo.delete(vaccine)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vaccine changes.

  ## Examples

      iex> change_vaccine(vaccine)
      %Ecto.Changeset{data: %Vaccine{}}

  """
  def change_vaccine(%Vaccine{} = vaccine, attrs \\ %{}) do
    Vaccine.changeset(vaccine, attrs)
  end

  def get_vaccinated_pet(id) do
    Repo.get!(Pet, id)
  end
end

defmodule VetPal.VaccinessTest do
  use VetPal.DataCase

  alias VetPal.Vacciness

  describe "vacciness" do
    alias VetPal.Vacciness.Vaccine

    @valid_attrs %{manufacturer: "some manufacturer", name: "some name"}
    @update_attrs %{manufacturer: "some updated manufacturer", name: "some updated name"}
    @invalid_attrs %{manufacturer: nil, name: nil}

    def vaccine_fixture(attrs \\ %{}) do
      {:ok, vaccine} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Vacciness.create_vaccine()

      vaccine
    end

    test "list_vacciness/0 returns all vacciness" do
      vaccine = vaccine_fixture()
      assert Vacciness.list_vacciness() == [vaccine]
    end

    test "get_vaccine!/1 returns the vaccine with given id" do
      vaccine = vaccine_fixture()
      assert Vacciness.get_vaccine!(vaccine.id) == vaccine
    end

    test "create_vaccine/1 with valid data creates a vaccine" do
      assert {:ok, %Vaccine{} = vaccine} = Vacciness.create_vaccine(@valid_attrs)
      assert vaccine.manufacturer == "some manufacturer"
      assert vaccine.name == "some name"
    end

    test "create_vaccine/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vacciness.create_vaccine(@invalid_attrs)
    end

    test "update_vaccine/2 with valid data updates the vaccine" do
      vaccine = vaccine_fixture()
      assert {:ok, %Vaccine{} = vaccine} = Vacciness.update_vaccine(vaccine, @update_attrs)
      assert vaccine.manufacturer == "some updated manufacturer"
      assert vaccine.name == "some updated name"
    end

    test "update_vaccine/2 with invalid data returns error changeset" do
      vaccine = vaccine_fixture()
      assert {:error, %Ecto.Changeset{}} = Vacciness.update_vaccine(vaccine, @invalid_attrs)
      assert vaccine == Vacciness.get_vaccine!(vaccine.id)
    end

    test "delete_vaccine/1 deletes the vaccine" do
      vaccine = vaccine_fixture()
      assert {:ok, %Vaccine{}} = Vacciness.delete_vaccine(vaccine)
      assert_raise Ecto.NoResultsError, fn -> Vacciness.get_vaccine!(vaccine.id) end
    end

    test "change_vaccine/1 returns a vaccine changeset" do
      vaccine = vaccine_fixture()
      assert %Ecto.Changeset{} = Vacciness.change_vaccine(vaccine)
    end
  end
end

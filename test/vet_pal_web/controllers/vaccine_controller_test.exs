defmodule VetPalWeb.VaccineControllerTest do
  use VetPalWeb.ConnCase

  alias VetPal.Vacciness

  @create_attrs %{manufacturer: "some manufacturer", name: "some name"}
  @update_attrs %{manufacturer: "some updated manufacturer", name: "some updated name"}
  @invalid_attrs %{manufacturer: nil, name: nil}

  def fixture(:vaccine) do
    {:ok, vaccine} = Vacciness.create_vaccine(@create_attrs)
    vaccine
  end

  describe "index" do
    test "lists all vacciness", %{conn: conn} do
      conn = get(conn, Routes.vaccine_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Vacciness"
    end
  end

  describe "new vaccine" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.vaccine_path(conn, :new))
      assert html_response(conn, 200) =~ "New Vaccine"
    end
  end

  describe "create vaccine" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.vaccine_path(conn, :create), vaccine: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.vaccine_path(conn, :show, id)

      conn = get(conn, Routes.vaccine_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Vaccine"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.vaccine_path(conn, :create), vaccine: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Vaccine"
    end
  end

  describe "edit vaccine" do
    setup [:create_vaccine]

    test "renders form for editing chosen vaccine", %{conn: conn, vaccine: vaccine} do
      conn = get(conn, Routes.vaccine_path(conn, :edit, vaccine))
      assert html_response(conn, 200) =~ "Edit Vaccine"
    end
  end

  describe "update vaccine" do
    setup [:create_vaccine]

    test "redirects when data is valid", %{conn: conn, vaccine: vaccine} do
      conn = put(conn, Routes.vaccine_path(conn, :update, vaccine), vaccine: @update_attrs)
      assert redirected_to(conn) == Routes.vaccine_path(conn, :show, vaccine)

      conn = get(conn, Routes.vaccine_path(conn, :show, vaccine))
      assert html_response(conn, 200) =~ "some updated manufacturer"
    end

    test "renders errors when data is invalid", %{conn: conn, vaccine: vaccine} do
      conn = put(conn, Routes.vaccine_path(conn, :update, vaccine), vaccine: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Vaccine"
    end
  end

  describe "delete vaccine" do
    setup [:create_vaccine]

    test "deletes chosen vaccine", %{conn: conn, vaccine: vaccine} do
      conn = delete(conn, Routes.vaccine_path(conn, :delete, vaccine))
      assert redirected_to(conn) == Routes.vaccine_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.vaccine_path(conn, :show, vaccine))
      end
    end
  end

  defp create_vaccine(_) do
    vaccine = fixture(:vaccine)
    %{vaccine: vaccine}
  end
end

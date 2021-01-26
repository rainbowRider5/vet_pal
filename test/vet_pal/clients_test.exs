defmodule VetPal.ClientsTest do
  use VetPal.DataCase

  alias VetPal.Clients

  describe "clients" do
    alias VetPal.Clients.Client

    @valid_attrs %{address: "some address", city: "some city", first_name: "some first_name", last_name: "some last_name"}
    @update_attrs %{address: "some updated address", city: "some updated city", first_name: "some updated first_name", last_name: "some updated last_name"}
    @invalid_attrs %{address: nil, city: nil, first_name: nil, last_name: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Clients.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Clients.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Clients.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Clients.create_client(@valid_attrs)
      assert client.address == "some address"
      assert client.city == "some city"
      assert client.first_name == "some first_name"
      assert client.last_name == "some last_name"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clients.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, %Client{} = client} = Clients.update_client(client, @update_attrs)
      assert client.address == "some updated address"
      assert client.city == "some updated city"
      assert client.first_name == "some updated first_name"
      assert client.last_name == "some updated last_name"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Clients.update_client(client, @invalid_attrs)
      assert client == Clients.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Clients.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Clients.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Clients.change_client(client)
    end
  end
end

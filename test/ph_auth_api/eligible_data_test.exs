defmodule PhAuthApi.EligibleDataTest do
  use PhAuthApi.DataCase

  alias PhAuthApi.EligibleData

  describe "offices" do
    alias PhAuthApi.EligibleData.Office

    import PhAuthApi.EligibleDataFixtures

    @invalid_attrs %{address: nil, email: nil, name: nil}

    test "list_offices/0 returns all offices" do
      office = office_fixture()
      assert EligibleData.list_offices() == [office]
    end

    test "get_office!/1 returns the office with given id" do
      office = office_fixture()
      assert EligibleData.get_office!(office.id) == office
    end

    test "create_office/1 with valid data creates a office" do
      valid_attrs = %{address: "some address", email: "some email", name: "some name"}

      assert {:ok, %Office{} = office} = EligibleData.create_office(valid_attrs)
      assert office.address == "some address"
      assert office.email == "some email"
      assert office.name == "some name"
    end

    test "create_office/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = EligibleData.create_office(@invalid_attrs)
    end

    test "update_office/2 with valid data updates the office" do
      office = office_fixture()
      update_attrs = %{address: "some updated address", email: "some updated email", name: "some updated name"}

      assert {:ok, %Office{} = office} = EligibleData.update_office(office, update_attrs)
      assert office.address == "some updated address"
      assert office.email == "some updated email"
      assert office.name == "some updated name"
    end

    test "update_office/2 with invalid data returns error changeset" do
      office = office_fixture()
      assert {:error, %Ecto.Changeset{}} = EligibleData.update_office(office, @invalid_attrs)
      assert office == EligibleData.get_office!(office.id)
    end

    test "delete_office/1 deletes the office" do
      office = office_fixture()
      assert {:ok, %Office{}} = EligibleData.delete_office(office)
      assert_raise Ecto.NoResultsError, fn -> EligibleData.get_office!(office.id) end
    end

    test "change_office/1 returns a office changeset" do
      office = office_fixture()
      assert %Ecto.Changeset{} = EligibleData.change_office(office)
    end
  end
end

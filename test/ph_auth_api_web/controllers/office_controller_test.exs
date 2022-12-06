defmodule PhAuthApiWeb.OfficeControllerTest do
  use PhAuthApiWeb.ConnCase

  import PhAuthApi.EligibleDataFixtures

  alias PhAuthApi.EligibleData.Office

  @create_attrs %{
    address: "some address",
    email: "some email",
    name: "some name"
  }
  @update_attrs %{
    address: "some updated address",
    email: "some updated email",
    name: "some updated name"
  }
  @invalid_attrs %{address: nil, email: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all offices", %{conn: conn} do
      conn = get(conn, Routes.office_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create office" do
    test "renders office when data is valid", %{conn: conn} do
      conn = post(conn, Routes.office_path(conn, :create), office: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.office_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "address" => "some address",
               "email" => "some email",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.office_path(conn, :create), office: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update office" do
    setup [:create_office]

    test "renders office when data is valid", %{conn: conn, office: %Office{id: id} = office} do
      conn = put(conn, Routes.office_path(conn, :update, office), office: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.office_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "email" => "some updated email",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, office: office} do
      conn = put(conn, Routes.office_path(conn, :update, office), office: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete office" do
    setup [:create_office]

    test "deletes chosen office", %{conn: conn, office: office} do
      conn = delete(conn, Routes.office_path(conn, :delete, office))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.office_path(conn, :show, office))
      end
    end
  end

  defp create_office(_) do
    office = office_fixture()
    %{office: office}
  end
end

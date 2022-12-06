defmodule PhAuthApiWeb.OfficeController do
  use PhAuthApiWeb, :controller

  alias PhAuthApi.EligibleData
  alias PhAuthApi.EligibleData.Office

  action_fallback PhAuthApiWeb.FallbackController

  def index(conn, _params) do
    offices = EligibleData.list_offices()
    render(conn, "index.json", offices: offices)
  end

  def create(conn, %{"office" => office_params}) do
    with {:ok, %Office{} = office} <- EligibleData.create_office(office_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.office_path(conn, :show, office))
      |> render("show.json", office: office)
    end
  end

  def show(conn, %{"id" => id}) do
    office = EligibleData.get_office!(id)
    render(conn, "show.json", office: office)
  end

  def update(conn, %{"id" => id, "office" => office_params}) do
    office = EligibleData.get_office!(id)

    with {:ok, %Office{} = office} <- EligibleData.update_office(office, office_params) do
      render(conn, "show.json", office: office)
    end
  end

  def delete(conn, %{"id" => id}) do
    office = EligibleData.get_office!(id)

    with {:ok, %Office{}} <- EligibleData.delete_office(office) do
      send_resp(conn, :no_content, "")
    end
  end
end

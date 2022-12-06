defmodule PhAuthApiWeb.OfficeView do
  use PhAuthApiWeb, :view
  alias PhAuthApiWeb.OfficeView

  def render("index.json", %{offices: offices}) do
    %{data: render_many(offices, OfficeView, "office.json")}
  end

  def render("show.json", %{office: office}) do
    %{data: render_one(office, OfficeView, "office.json")}
  end

  def render("office.json", %{office: office}) do
    %{
      id: office.id,
      name: office.name,
      address: office.address,
      email: office.email
    }
  end
end

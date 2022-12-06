defmodule PhAuthApiWeb.PageController do
  use PhAuthApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

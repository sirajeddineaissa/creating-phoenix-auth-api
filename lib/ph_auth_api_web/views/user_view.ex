defmodule PhAuthApiWeb.UserView do
  use PhAuthApiWeb, :view
  alias PhAuthApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user, jwt: jwt}) do
    %{
      id: user.id,
      email: user.email,
      jwt: jwt
    }
  end

  def render("login_success.json", %{jwt: jwt}) do
    %{success: true, jwt: jwt}
  end
end

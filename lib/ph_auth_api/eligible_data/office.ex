defmodule PhAuthApi.EligibleData.Office do
  use Ecto.Schema
  import Ecto.Changeset

  schema "offices" do
    field :address, :string
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(office, attrs) do
    office
    |> cast(attrs, [:name, :address, :email])
    |> validate_required([:name, :address, :email])
    |> unique_constraint(:email)
  end
end

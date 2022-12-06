defmodule PhAuthApi.Repo.Migrations.CreateOffices do
  use Ecto.Migration

  def change do
    create table(:offices) do
      add :name, :string
      add :address, :string
      add :email, :string

      timestamps()
    end

    create unique_index(:offices, [:email])
  end
end

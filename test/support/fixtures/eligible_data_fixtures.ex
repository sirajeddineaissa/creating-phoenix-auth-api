defmodule PhAuthApi.EligibleDataFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhAuthApi.EligibleData` context.
  """

  @doc """
  Generate a unique office email.
  """
  def unique_office_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a office.
  """
  def office_fixture(attrs \\ %{}) do
    {:ok, office} =
      attrs
      |> Enum.into(%{
        address: "some address",
        email: unique_office_email(),
        name: "some name"
      })
      |> PhAuthApi.EligibleData.create_office()

    office
  end
end

# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhAuthApi.Repo.insert!(%PhAuthApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PhAuthApi.Repo
alias PhAuthApi.EligibleData.Office
alias PhAuthApi.Accounts.User

# Repo.insert!(%Office{name: "test1", address: "test1", email: "test1@mail.com"})
# Repo.insert!(%Office{name: "test2", address: "test2", email: "test2@mail.com"})
# Repo.insert!(%Office{name: "test3", address: "test3", email: "test3@mail.com"})
Repo.insert!(User.changeset(%User{}, %{email: "user1@mail.com", password: "passwordpasswordland1"}))

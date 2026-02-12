defmodule ExBank.Users.Create do
  alias ExBank.Repo
  alias ExBank.Users.User

  def call(attrs) do
    %User{}
    |> User.create_changeset(attrs)
    |> Repo.insert()
  end
end

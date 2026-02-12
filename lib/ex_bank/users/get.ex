defmodule ExBank.Users.Get do
  alias ExBank.Repo
  alias ExBank.Users.User

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end

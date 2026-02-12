defmodule ExBank.Users do
  alias ExBank.Users.Create
  alias ExBank.Users.Get

  defdelegate create_user(params), to: Create, as: :call
  defdelegate get_user(id), to: Get, as: :call
end

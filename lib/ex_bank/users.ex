defmodule ExBank.Users do
  alias ExBank.Users.Create
  alias ExBank.Users.Get
  alias ExBank.Users.Update

  defdelegate create_user(params), to: Create, as: :call
  defdelegate get_user(id), to: Get, as: :call
  defdelegate update_user(params), to: Update, as: :call
end

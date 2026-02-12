defmodule ExBank.Users do
  alias ExBank.Users.Create

  defdelegate create_user(params), to: Create, as: :call
end

defmodule ExBankWeb.UserJSON do
  def create(%{user: user}), do: %{message: "User created successfully", data: user}
  def get(%{user: user}), do: %{data: user}
end

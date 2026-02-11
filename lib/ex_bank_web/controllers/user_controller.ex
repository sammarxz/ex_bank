defmodule ExBankWeb.UserController do
  use ExBankWeb, :controller

  alias ExBank.Users.Create

  action_fallback ExBankWeb.FallbackController

  def create(conn, params) do
    with {:ok, user} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end
end

defmodule ExBankWeb.UserController do
  use ExBankWeb, :controller

  alias ExBank.Users
  alias Users.User

  action_fallback ExBankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create_user(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.get_user(id) do
      conn
      |> put_status(:ok)
      |> render(:get, user: user)
    end
  end
end

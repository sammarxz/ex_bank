defmodule ExBankWeb.UserController do
  use ExBankWeb, :controller

  alias ExBank.Users.Create

  def create(conn, params) do
    params
    |> Create.call()
    |> handle_response(conn)
  end

  defp handle_response({:ok, user}, conn) do
    conn
    |> put_status(:created)
    |> render(:create, user: user)
  end

  defp handle_response({:error, _changeset}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(%{error: "Invalid parameters"})
  end
end

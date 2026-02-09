defmodule ExBankWeb.WelcomeController do
  use ExBankWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(200)
    |> json(%{message: "Welcome to ExBank"})
  end
end

defmodule ExBankWeb.WelcomeController do
  use ExBankWeb, :controller

  def index(conn, _params) do
    send_resp(conn, 200, "Hello World")
  end
end

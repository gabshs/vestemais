defmodule VestemaisWeb.FallbackController do
  use VestemaisWeb, :controller

  alias Vestemais.Error
  alias VestemaisWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end

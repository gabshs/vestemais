defmodule VestemaisWeb.EstablishmentsController do
  use VestemaisWeb, :controller

  alias Vestemais.Establishments.Establishment
  alias VestemaisWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    with {:ok, establishments} <- Vestemais.get_all_establishments() do
      conn
      |> put_status(:ok)
      |> render("index.json", establishments: establishments)
    end
  end

  def create(conn, params) do
    with {:ok, %Establishment{} = establishment} <- Vestemais.create_establishment(params) do
      conn
      |> put_status(:created)
      |> render("create.json", establishment: establishment)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, establishment} <- Vestemais.get_establishment_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("establishment.json", establishment: establishment)
    end
  end
end

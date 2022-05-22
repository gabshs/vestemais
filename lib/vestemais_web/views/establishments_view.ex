defmodule VestemaisWeb.EstablishmentsView do
  use VestemaisWeb, :view

  alias Vestemais.Establishments.Establishment

  def render("index.json", %{establishments: establishments}) do
    establishments
  end

  def render("create.json", %{establishment: %Establishment{} = establishment}) do
    %{
      message: "Establishment created!",
      establishment: establishment
    }
  end
end

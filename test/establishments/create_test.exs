defmodule Vestemais.Establishments.CreateTest do
  use Vestemais.DataCase, async: true
  import Vestemais.Factory
  alias Vestemais.Establishments.Establishment

  describe "call/1" do
    setup do
      establishment = build(:establishment_params)

      {:ok, establishment: establishment}
    end

    test "returns a valid establishment when valid params are passed", %{
      establishment: establishment
    } do
      response = Vestemais.create_establishment(establishment)

      assert {:ok, %Establishment{}} = response
    end

    test "throws when any parameters has invalid", %{establishment: establishment} do
      invalid_params = establishment |> Map.replace(:name, "")
      response = Vestemais.create_establishment(invalid_params)

      assert {:error, _reason} = response
    end
  end
end

defmodule Vestemais.Establishments.GetTest do
  use Vestemais.DataCase, async: true
  import Vestemais.Factory
  import Ecto.Repo
  alias Vestemais.Error
  alias Vestemais.Establishments.Establishment

  describe "all/0" do
    test "returns all establishments when there is at least one registered establishment" do
      establishment = build(:establishment_params)

      Vestemais.create_establishment(establishment)

      response = Vestemais.get_all_establishments()

      assert {:ok, [%Establishment{} | _rest]} = response
    end

    test "retuns empty array when there is no registered establishment" do
      response = Vestemais.get_all_establishments()

      assert {:ok, []} = response
    end
  end

  describe "by_id/1" do
    test "returns a establishment when it exists with the given ID" do
      establishment = build(:establishment_params)

      {:ok, valid_establishment} = Vestemais.create_establishment(establishment)

      response = Vestemais.get_establishment_by_id(valid_establishment.id)

      assert {:ok, %Establishment{}} = response
    end

    test "throws when no establishment is found with the given ID" do
      invalid_id = "0e2e9826-6eff-4165-85be-f269108bde04"

      response = Vestemais.get_establishment_by_id(invalid_id)

      assert {:error, %Error{result: "Establishment not found."}} = response
    end
  end
end

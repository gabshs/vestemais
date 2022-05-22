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

  # describe "by_id/1" do
  #   test "returns a marketplace when it exists with the given ID" do
  #     field = build(:marketplace_field_params)
  #     marketplace = build(:marketplace_params, marketplace_fields: [field])

  #     {:ok, valid_marketplace} = Vestemais.create_marketplace(marketplace)

  #     response = Vestemais.get_marketplace_by_id(valid_marketplace.id)

  #     assert {:ok, %Marketplace{}} = response
  #   end

  #   test "throws when no marketplace is found with the given ID" do
  #     invalid_id = "0e2e9826-6eff-4165-85be-f269108bde04"

  #     response = Vestemais.get_marketplace_by_id(invalid_id)

  #     assert {:error, %Error{result: "Marketplace not found."}} = response
  #   end
  # end
end

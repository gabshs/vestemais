defmodule VestemaisWeb.EstablishmentsControllerTest do
  use VestemaisWeb.ConnCase, async: true
  import Vestemais.Factory

  describe "index/2" do
    test "shows all establishments when there is at least one registered establishment", %{
      conn: conn
    } do
      [
        insert(:establishment, id: "bc542c05-e3fe-4d86-8f06-599f2259521e", name: "test1"),
        insert(:establishment, id: "4210746d-bc0c-4ca1-accb-a76f30da8841", name: "test2")
      ]

      response =
        conn
        |> get(Routes.establishments_path(conn, :index))
        |> json_response(:ok)

      assert [
               %{
                 "cnpj" => "11.1231.132/00001-12",
                 "id" => "bc542c05-e3fe-4d86-8f06-599f2259521e",
                 "lat" => "41.40338",
                 "long" => "2.17403",
                 "name" => "test1",
                 "phone" => "(62) 9 9443-3917"
               },
               %{
                 "cnpj" => "11.1231.132/00001-12",
                 "id" => "4210746d-bc0c-4ca1-accb-a76f30da8841",
                 "lat" => "41.40338",
                 "long" => "2.17403",
                 "name" => "test2",
                 "phone" => "(62) 9 9443-3917"
               }
             ] = response
    end

    test "returns empty array when there is no registered establishment", %{conn: conn} do
      response =
        conn
        |> get(Routes.establishments_path(conn, :index))
        |> json_response(:ok)

      assert [] = response
    end
  end

  describe "show/2" do
    test "shows a establishment when it exists with the given ID", %{conn: conn} do
      establishment =
        insert(:establishment, id: "bc542c05-e3fe-4d86-8f06-599f2259521e", name: "test1")

      response =
        conn
        |> get(Routes.establishments_path(conn, :show, establishment.id))
        |> json_response(:ok)

      assert %{
               "cnpj" => "11.1231.132/00001-12",
               "id" => "bc542c05-e3fe-4d86-8f06-599f2259521e",
               "lat" => "41.40338",
               "long" => "2.17403",
               "name" => "test1",
               "phone" => "(62) 9 9443-3917"
             } = response
    end

    test "throws when no establishment is found with the given ID", %{conn: conn} do
      invalid_id = "cd039649-f675-4267-b427-7ea5ee14d580"

      response =
        conn
        |> get(Routes.establishments_path(conn, :show, invalid_id))
        |> json_response(:not_found)

      assert %{"message" => "Establishment not found."} = response
    end
  end

  describe "create/2" do
    test "creates a establishment when all params are valid", %{conn: conn} do
      establishment_params = build(:establishment_params, name: "test1")

      response =
        conn
        |> post(Routes.establishments_path(conn, :create), establishment_params)
        |> json_response(:created)

      assert %{
               "establishment" => %{
                 "cnpj" => "11.1231.132/00001-12",
                 "id" => _,
                 "lat" => "41.40338",
                 "long" => "2.17403",
                 "name" => "test1",
                 "phone" => "(62) 9 9443-3917"
               }
             } = response
    end

    test "throws when any param is invalid", %{conn: conn} do
      establishment = build(:establishment_params, name: nil)

      response =
        conn
        |> post(Routes.establishments_path(conn, :create), establishment)
        |> json_response(:bad_request)

      assert %{"message" => %{"name" => ["can't be blank"]}} = response
    end
  end
end

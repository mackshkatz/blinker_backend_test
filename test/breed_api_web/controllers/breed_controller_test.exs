defmodule BreedApiWeb.BreedControllerTest do
  use BreedApiWeb.ConnCase

  describe "GET /api/breeds" do
    test "returns list of breeds" do
      insert_list(2, :breed)

      conn =
        build_conn()
        |> put_req_header("content-type", "application/json")
        |> get("/api/breeds")

      assert [
               %{
                 "id" => _,
                 "name" => _,
                 "description" => _,
                 "country" => _,
                 "images" => _
               },
               %{
                 "id" => _,
                 "name" => _,
                 "description" => _,
                 "country" => _,
                 "images" => _
               }
             ] = json_response(conn, 200)
    end
  end

  describe "GET /api/breeds/:id" do
    test "returns specified breed" do
      breed_id = insert(:breed).id

      conn =
        build_conn()
        |> put_req_header("content-type", "application/json")
        |> get("/api/breeds/#{breed_id}")

      assert %{
               "id" => ^breed_id,
               "name" => _name,
               "description" => _description,
               "country" => _country,
               "images" => _
             } = json_response(conn, 200)
    end
  end
end

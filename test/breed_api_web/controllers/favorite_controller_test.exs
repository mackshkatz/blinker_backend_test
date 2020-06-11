defmodule BreedApiWeb.FavoriteControllerTest do
  use BreedApiWeb.ConnCase
  alias BreedApi.Repo
  require Ecto.Query

  describe "GET /api/favorites" do
    test "returns list of favorites" do
      insert_list(2, :favorite)

      conn =
        build_conn()
        |> put_req_header("content-type", "application/json")
        |> get("/api/favorites")

      assert [
               %{
                 "id" => _,
                 "breed" => %{
                   "name" => _,
                   "description" => _,
                   "country" => _,
                   "images" => _
                 }
               },
               %{
                 "id" => _,
                 "breed" => %{
                   "name" => _,
                   "description" => _,
                   "country" => _,
                   "images" => _
                 }
               }
             ] = json_response(conn, 200)
    end
  end

  describe "GET /api/favorites/:id" do
    test "returns specified favorite" do
      favorite_id = insert(:favorite).id

      conn =
        build_conn()
        |> put_req_header("content-type", "application/json")
        |> get("/api/favorites/#{favorite_id}")

      assert %{
               "id" => ^favorite_id,
               "breed" => %{
                 "name" => _name,
                 "description" => _description,
                 "country" => _country,
                 "images" => _
               }
             } = json_response(conn, 200)
    end
  end

  describe "POST /api/favorites/add" do
    test "returns :no_content" do
      breed_id = insert(:breed).id

      conn =
        build_conn()
        |> put_req_header("content-type", "application/json")
        |> post("/api/favorites/add", %{breed_id: breed_id})

      assert response(conn, 204)
    end

    test "adds a breed to the favorites list" do
      breed_id = insert(:breed).id
      query = Ecto.Query.from(f in BreedApi.Favorite)

      assert Repo.aggregate(query, :count, :id) == 0

      build_conn()
      |> put_req_header("content-type", "application/json")
      |> post("/api/favorites/add", %{breed_id: breed_id})

      assert Repo.aggregate(query, :count, :id) == 1
    end
  end

  describe "DELETE /api/favorites/:id" do
    test "returns :no_content" do
      favorite = insert(:favorite)

      conn =
        build_conn()
        |> put_req_header("content-type", "application/json")
        |> delete("/api/favorites/#{favorite.id}")

      assert response(conn, 204)
    end

    test "deletes a favorite (removed from the favorites list)" do
      favorite = insert(:favorite)
      query = Ecto.Query.from(f in BreedApi.Favorite)

      assert Repo.aggregate(query, :count, :id) == 1

      build_conn()
      |> put_req_header("content-type", "application/json")
      |> delete("/api/favorites/#{favorite.id}")

      assert Repo.aggregate(query, :count, :id) == 0
    end
  end
end

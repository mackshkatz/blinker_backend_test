# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BreedApi.Repo.insert!(%BreedApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

with {:ok, dog_json} <- File.read("../data/dogs.json") do
  dog_json
  |> Jason.decode!()
  |> Enum.each(fn breed ->
    %BreedApi.Breed{
      country: breed["country"],
      description: breed["description"],
      images: breed["images"],
      name: breed["name"]
    }
    |> BreedApi.Repo.insert!()
  end)
else
  {:error, error} -> IO.puts("Error while importing dogs.json: #{error}")
end

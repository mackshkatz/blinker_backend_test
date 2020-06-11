defmodule BreedApi.Factory do
  use ExMachina.Ecto, repo: BreedApi.Repo

  def breed_factory do
    %BreedApi.Breed{
      name: Faker.Cat.En.breed(),
      description: Faker.Lorem.paragraph(),
      country: Faker.Address.En.country(),
      images: ["https://images.dog.ceo/breeds/affenpinscher/n02110627_10147.jpg"]
    }
  end

  def favorite_factory do
    %BreedApi.Favorite{
      breed: build(:breed)
    }
  end
end

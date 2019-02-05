FactoryBot.define do
  factory :city do
    name { Faker::GameOfThrones.city }
    zip { Faker::Address.zip_code }
  end
end

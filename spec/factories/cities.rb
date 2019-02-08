FactoryBot.define do
  factory :city do
    name { Faker::Address.city }
    zip { Faker::Address.zip_code }
  end
end

FactoryBot.define do
  factory :user do
    first_name { Faker::GameOfThrones.character }
    last_name { Faker::StarWars.character }
    description { Faker::Lorem.paragraphs }
    age { rand(20..30) }
    email { Faker::Internet.free_email }
    city { FactoryBot.create(:city) }
  end
end

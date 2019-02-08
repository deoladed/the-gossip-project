FactoryBot.define do
  factory :user do
    first_name { Faker::GreekPhilosophers.name }
    last_name { Faker::StarWars.character }
    description { Faker::Lorem.paragraphs }
    age { rand(20..30) }
    email { Faker::Internet.free_email }
    city { FactoryBot.create(:city) }
    pass = Faker::Internet.password(8)
    password { pass }
    password_confirmation { pass }
  end
end

FactoryBot.define do
  factory :potin do
    date { "2019-02-04 12:24:57" }
    title { Faker::NewGirl.quote }
    content { Faker::Lorem.paragraphs(4) }
    user { FactoryBot.create(:user) }
  end
end

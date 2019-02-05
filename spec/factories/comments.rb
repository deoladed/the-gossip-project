FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraphs }
    user { FactoryBot.create(:user) }
    commenteable { FactoryBot.create(:potin) }
  end
end

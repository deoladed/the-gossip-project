FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user { nil }
    commenteable { nil }
  end
end

FactoryBot.define do
  factory :private_message do
    sender { FactoryBot.create(:user) }
  end
end

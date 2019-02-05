FactoryBot.define do
  factory :join_table_mp_user do
    recipient { FactoryBot.create(:user) }
    private_message { FactoryBot.create(:private_message) }
  end
end

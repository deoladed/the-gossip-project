FactoryBot.define do
  factory :joint_table_potin_tag do
    potin { FactoryBot.create(:potin) }
    tag { FactoryBot.create(:tag) }
  end
end

FactoryBot.define do
  factory :work_test_one do
    work_column1 { '00001' }
    work_column2 { Faker::Lorem.characters(number: 5) }
    work_column3 { Faker::Lorem.characters(number: 5) }
  end
end

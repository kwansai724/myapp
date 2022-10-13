FactoryBot.define do
  factory :work_test_two do
    work_column4 { '00001' }
    work_column5 { Faker::Lorem.characters(number:5) }
    work_column6 { Faker::Lorem.characters(number:5) }
  end
end
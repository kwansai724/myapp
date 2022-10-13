FactoryBot.define do
  factory :test do
    column1 { '00001' }
    column2 { Faker::Lorem.characters(number:5) }
    column3 { Faker::Lorem.characters(number:5) }
  end
end
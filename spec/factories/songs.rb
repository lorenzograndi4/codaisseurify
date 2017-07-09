FactoryGirl.define do
  factory :song do
    name  { Faker::Lorem.word }
    year  { Faker::Number.number(4) }
    genre { Faker::Lorem.word }
  end
end

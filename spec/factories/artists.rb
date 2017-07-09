FactoryGirl.define do
  factory :artist do
    name  { Faker::Internet.user_name }
    genre { Faker::Lorem.word }
    bio   { Faker::Lorem.sentence }
  end
end

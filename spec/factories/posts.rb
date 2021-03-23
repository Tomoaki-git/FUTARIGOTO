FactoryBot.define do
  factory :post do
    title         { Faker::Lorem.sentence }
    content       { Faker::Lorem.sentence }
    first_choice  { Faker::Lorem.word }
    second_choice { Faker::Lorem.word }
    third_choice  { Faker::Lorem.word }
    comment       { Faker::Boolean.boolean }
    association :user
  end
end

FactoryBot.define do
  factory :user do
    email                   { Faker::Internet.unique.free_email }
    nickname                { Faker::Name.initials(number: 4) }
    password                { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation   { password }
  end
end
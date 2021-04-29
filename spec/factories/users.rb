FactoryBot.define do
  factory :user do
    sequence(:name) { Faker::Name.name }
    sequence(:email) { Faker::Internet.unique.email }
    password_digest {"123456789"}
  end
end

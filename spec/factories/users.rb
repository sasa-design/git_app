FactoryBot.define do
  factory :user do
    sequence(:name) { Faker::Name.name }
    sequence(:email) { Faker::Internet.unique.email }
    password {"123456789"}
  end
end

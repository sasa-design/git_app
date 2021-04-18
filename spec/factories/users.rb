FactoryBot.define do
  factory :user do
    sequence(:name) { "Test_user_name" }
    sequence(:email) { "Test_email@gmail.com" }
    password {"123456789"}
  end
end

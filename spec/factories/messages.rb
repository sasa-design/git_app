FactoryBot.define do
  factory :message do
    user
    sender_id {"1"}
    receiver_id {"2"}
    content {"aaa"}
  end
end

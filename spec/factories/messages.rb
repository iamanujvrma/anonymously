FactoryBot.define do
  factory :message do
    content "Hello, Welcome to the app!!"
    association :sender, factory: :user
    association :reciever, factory: :user
  end
end

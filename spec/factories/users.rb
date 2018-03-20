FactoryBot.define do
  factory :user do
    name 'MyString'
    date_of_birth '2018-02-06 16:21:16'
    gender 'male'
    email  Faker::Internet.email
    password 'pinky@10'
    association :sent_messages, factory: :message
    association :received_messages, factory: :message
  end
end

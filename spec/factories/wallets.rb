FactoryBot.define do
  factory :wallet do
    points 50
    association :user, factory: :user
  end
end
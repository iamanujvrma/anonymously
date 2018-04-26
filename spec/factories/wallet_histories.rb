FactoryBot.define do
  factory :wallet_history do
    points 10
    recepient_name 'Raj'
    transaction_type 'Referral'
    association :wallet, factory: :wallet
  end
end
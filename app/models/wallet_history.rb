class WalletHistory < ApplicationRecord
  belongs_to :wallet
  validates :recepient_name, :points, presence: true
  validates :transaction_type, presence: true, inclusion: { in: %w(Referral Unlocked Like), message: "Invalid transaction type" }
end
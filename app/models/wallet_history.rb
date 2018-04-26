# frozen_string_literal: true

class WalletHistory < ApplicationRecord
  belongs_to :wallet
  validates :recepient_name, presence: true
  validates :points, format: { with: /\A-?\d+\Z/ }
  validates :transaction_type, inclusion: { in: %w[Referral Unlocked Like] }
end

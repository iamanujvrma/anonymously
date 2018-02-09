class Wallet < ApplicationRecord
#  belongs_to :user
  has_many :wallet_histories
  validates :points, presence: true, numericality: {greater_than_or_equal_to: 0}
end
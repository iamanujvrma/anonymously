# frozen_string_literal: true

class Wallet < ApplicationRecord
  #  belongs_to :user
  has_many :wallet_histories
  validates :points, format: { with: /\A\d+\Z/ }
end

class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: {maximum: 1200, messgae: 'Message length should be less than 1200 characters'}
  validates :receiver_id, presence: true, numeracality: {only_integer: true, greater_than: 0, message: 'Should be an integer greater than 0'}
  validates :is_read, inclusion: { in: [1, 0] }
  validates :is_liked, inclusion: { in: [1, 0] }
  validates :is_unlocked, inclusion: { in: [1, 0] }   
end

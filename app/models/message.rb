class Message < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  validates :content, presence: true, length: {maximum: 1200, messgae: 'Message length should be less than 1200 characters'}
  validates :is_read, inclusion: { in: [1, 0] }
  validates :is_liked, inclusion: { in: [1, 0] }
  validates :is_unlocked, inclusion: { in: [1, 0] }   
end

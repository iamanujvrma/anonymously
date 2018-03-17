class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  validates :content, presence: true
  validates :is_read, inclusion: { in: [1, 0] }
  validates :is_liked, inclusion: { in: [1, 0] }
  validates :is_unlocked, inclusion: { in: [1, 0] }
end

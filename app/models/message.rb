class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  validates :content, presence: true
  validates :is_read, inclusion: { in: [1, 0] }
  validates :is_liked, inclusion: { in: [1, 0] }
  validates :is_unlocked, inclusion: { in: [1, 0] }

  validate  :sender_id_not_equal_to_receiver_id? 

  def sender_id_not_equal_to_receiver_id?
    if sender_id == receiver_id
      self.errors.add(:base, 'sender id cannot be same as received id')
    end
  end
end


# frozen_string_literal: true

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :gender, presence: true
  validates_inclusion_of :gender, in: %w[Male Female], message: 'Invalid gender'

  validates :name, presence: true,
                   length: { minimum: 2, maximum: 20 },
                   format: {
                     with: /\A[A-Za-z][A-Za-z0-9]*\s*_*[A-Za-z0-9]*/,
                     message: 'name cannot start with a number or underscore'
                   }

  validates :date_of_birth, presence: true
  validate :valid_dob?
  has_one :wallet 
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'

  def messages
    Message.where("sender_id = ? OR receiver_id = ?", self.id, self.id)
  end

  private

  def valid_dob?
    unless date_of_birth.is_a?(Time)
      errors.add(:date_of_birth, 'Is an invalid date.')
      return
    end
    if date_of_birth.future?
      errors.add(:date_of_birth, 'Date of Birth cannot be in future.')
    end
  end

end

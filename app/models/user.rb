# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :gender, presence: true
  validates_inclusion_of :gender, in: %w[Male male Female female], message: 'Invalid gender'

  validates :name, presence: true,
                   length: { minimum: 2, maximum: 20 },
                   format: {
                     with: /\A[A-Za-z][A-Za-z0-9]*\s*_*[A-Za-z0-9]*/,
                     message: 'name cannot start with a number or underscore'
                   }

  validates :date_of_birth, presence: true
  validate :valid_dob?

  has_many :messages

  private

  def valid_dob?
    return unless valid_date?
    return unless date_of_birth.future?
    errors.add(:date_of_birth, 'Date of Birth cannot be in future.')
  end

  def valid_date?
    return true if date_of_birth.is_a?(Time)
    errors.add(:date_of_birth, 'Is an invalid date.')
    false
  end
end
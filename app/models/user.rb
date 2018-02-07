class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :gender , presence: true 
	validates_inclusion_of :gender, :in => ['Male','male','Female','female'], message: 'Invalid gender'


  validates :name, presence: true,
                   length: { minimum: 2, maximum: 20 },
                   format: {
                            with: /\A[A-Za-z][A-Za-z0-9]*\s*_*[A-Za-z0-9]*/,
                            message: "name cannot start with a number or underscore"
                           }
 

  validates :date_of_birth, presence: true
  validate :valid_dob?

  private
  def valid_dob?
    if valid_date?
      if date_of_birth.future?
        errors.add(:date_of_birth, "Date of Birth cannot be in future.")
      end
    end
  end

  def valid_date?
    if date_of_birth.is_a?(Time)
      return true
    end
    errors.add(:date_of_birth, "Is an invalid date.")
    false
  end
<<<<<<< HEAD
end
=======

end
>>>>>>> c33eed8eea418f2711195c4137b5b37b8af9a384

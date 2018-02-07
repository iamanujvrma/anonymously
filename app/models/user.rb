class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :gender , presence: true 
	validates_inclusion_of :gender, :in => ['Male','male','Female','female']


  validates :name, presence: true,
                   length: { minimum: 2, maximum: 20 },
	                 format: {
	                 	 with: /\A[A-Za-z][A-Za-z0-9]*\s*_*[A-Za-z0-9]*/,
	                   message: "name cannot start with a number or underscore"
	                 }

end

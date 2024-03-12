class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations for the new fields
  validates :emailAddr, presence: true, uniqueness: true
  # Assuming userName is a devise field or added elsewhere, uncomment if needed:
  # validates :userName, presence: true, uniqueness: true
  validates :keyIdAuth, presence: true
  
  # nickname is optional, so no validation for presence
end

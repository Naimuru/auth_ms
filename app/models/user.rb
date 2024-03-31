class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations for the new fields
  #validates :emailAddr, presence: true, uniqueness: true
  # validates :userName, presence: true, uniqueness: true
  #validates :keyIdAuth, presence: true
  
  # nickname is optional, so no validation for presence
end

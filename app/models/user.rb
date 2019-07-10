class User < ApplicationRecord
  has_many :user_pets
  has_many :pets, through: :user_pets

  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
end

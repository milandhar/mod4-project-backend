class UserPet < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :user_id, uniqueness: { scope: :pet_id }

end

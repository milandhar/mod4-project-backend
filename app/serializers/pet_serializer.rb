class PetSerializer < ActiveModel::Serializer
  has_many :users, through: :user_pets
  attributes :id, :name, :small_photo_url, :medium_photo_url, :gender, :description,
  :breed_primary, :species, :age, :status, :email_address, :profile_url
end

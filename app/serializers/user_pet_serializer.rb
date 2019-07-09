class UserPetSerializer < ActiveModel::Serializer
  belongs_to :pet
  belongs_to :user
  attributes :id
end

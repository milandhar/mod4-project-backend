class UserSerializer < ActiveModel::Serializer
  has_many :pets, through: :user_pets
  attributes :username, :password_digest, :img_path, :zipcode,
    :email_address, :message_template
end

class UserSerializer < ActiveModel::Serializer
  attributes :username, :password_digest, :img_path, :zipcode,
    :email_address, :message_template
end

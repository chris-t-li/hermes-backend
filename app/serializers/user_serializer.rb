class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :avatar_url
  has_many :contacts
end

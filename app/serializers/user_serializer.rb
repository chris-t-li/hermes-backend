class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :avatar_url
  has_many :contacts
  # def contact_status
  #   # byebug
  #   # self.object.contacts
  # end
  # has_many :contacts

end

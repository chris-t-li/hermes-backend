class ContactSerializer < ActiveModel::Serializer
  attributes :id
  has_one :friend
  has_one :user
end

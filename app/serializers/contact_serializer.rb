class ContactSerializer < ActiveModel::Serializer
  attributes :id, :show_contacts
  has_one :friend
  has_one :user

end

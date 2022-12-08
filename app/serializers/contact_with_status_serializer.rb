class ContactWithStatusSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :avatar_url, :contact_status
end

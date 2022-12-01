class SenderSerializer < ActiveModel::Serializer
  attributes :id, :user
  has_one :user
end

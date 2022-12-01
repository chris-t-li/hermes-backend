class MessageReceiverSerializer < ActiveModel::Serializer
  attributes :id
  has_one :message
  has_one :receiver
end

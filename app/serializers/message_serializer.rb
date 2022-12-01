class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :sender

  # def sender_details
  #   byebug
  # end
end

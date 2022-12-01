class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
  belongs_to :sender

  # def sender_details
  #   byebug
  # end
end

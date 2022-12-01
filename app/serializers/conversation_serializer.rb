class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :messages
  # has_many :participants
  has_many :users
end

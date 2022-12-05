class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :title, :most_recent_message
  has_many :messages
  # has_many :participants
  has_many :users

  def most_recent_message
    self.object.messages.last
  end
end

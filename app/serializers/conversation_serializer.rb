class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :title, :most_recent_message, :most_recent_message_timestamp
  has_many :messages
  # has_many :participants
  has_many :users

  def most_recent_message
    self.object.messages.last
  end

  def most_recent_message_timestamp
      find_message_created_at_date = self.object.messages.order(:created_at).last.created_at.to_date
      if find_message_created_at_date == Date.today 
          find_message_created_at.to_fs(:time)
      elsif find_message_created_at_date == Date.yesterday
          "Yesterday"
      else
          find_message_created_at_date
      end
  end
end

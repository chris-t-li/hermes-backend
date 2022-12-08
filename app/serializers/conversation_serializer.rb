class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :title, :convo_url, :most_recent_message, :most_recent_message_timestamp
  has_many :messages
  has_many :participants
  has_many :users

  def most_recent_message
    if self.object.messages
      self.object.messages.last
    else 
    end
  end

  def most_recent_message_timestamp
    if self.object.messages
      find_message_created_at = self.object.messages.order(:created_at).last.created_at
      if find_message_created_at.to_date == Date.today 
        find_message_created_at.to_fs(:time)
      elsif find_message_created_at.to_date == Date.yesterday
          "Yesterday"
      else
          find_message_created_at.to_date
      end
    else
    end
  end
  
end

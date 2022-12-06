class Conversation < ApplicationRecord
    has_many :messages
    has_many :users, through: :messages

    has_many :participants, dependent: :destroy
    has_many :users, through: :participants

    validates :title, presence: true

    def most_recent_message_timestamp
        find_message_created_at_date = self.messages.order(:created_at).last.created_at.to_date
        if find_message_created_at_date == Date.today 
            find_message_created_at.to_fs(:time)
        elsif find_message_created_at_date == Date.yesterday
            "Yesterday"
        else
            find_message_created_at_date
        end
    end

    # if created_at == Date.today, show time as HH:MM
    # else show time as Yesterday, or date of when message was shown

end

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :content, presence: true
  validates :conversation_id, presence: true
  # Add validation so that only a participant can create a message in the conversation
  # validates :user_id, uniqueness: {scope: participant_id}
end

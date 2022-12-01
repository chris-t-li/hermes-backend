class Message < ApplicationRecord
  belongs_to :sender
  belongs_to :conversation

  has_many :message_receivers
  has_many :receivers, through: :message_receivers
end

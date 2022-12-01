class MessageReceiver < ApplicationRecord
  belongs_to :message
  belongs_to :receiver
end

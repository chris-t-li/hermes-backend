class Conversation < ApplicationRecord
    has_many :messages
    has_many :senders, through: :messages
end

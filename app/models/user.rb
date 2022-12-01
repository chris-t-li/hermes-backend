class User < ApplicationRecord
    has_many :participants
    has_many :conversations, through: :participants
    has_many :messages
    has_many :conversations, through: :messages
end

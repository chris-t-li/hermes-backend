class Conversation < ApplicationRecord
    has_many :messages
    has_many :users, through: :messages

    has_many :participants, dependent: :destroy
    has_many :users, through: :participants

    validates :title, presence: true
end

class User < ApplicationRecord
    has_secure_password
    has_many :participants
    has_many :conversations, through: :participants
    has_many :messages
    # has_many :conversations, through: :messages

    has_many :contacts
    has_many :friends, through: :contacts
    validates :username, uniqueness: true
end

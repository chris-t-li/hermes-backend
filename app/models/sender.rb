class Sender < ApplicationRecord
  belongs_to :user

  has_many :messages
  has_many :conversations, through: :messages
  
end

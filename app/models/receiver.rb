class Receiver < ApplicationRecord
  belongs_to :user

  has_many :message_receivers
  has_many :messages, through: :message_receivers
end

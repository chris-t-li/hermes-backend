class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, presence: true
  validates :friend_id, presence: true

  validate :cannot_friend_self
  validate :friendship_already_exists

  def cannot_friend_self
    if user_id == friend_id
      errors.add(:user_id, "can't befriend yourself")
    end
  end

  def friendship_already_exists
    f1 = Contact.find_by(user_id: user_id, friend_id: friend_id)
    f2 = Contact.find_by(user_id: friend_id, friend_id: user_id)
    
    if f1 || f2
      errors.add(:contact, "already exists")
    end
  end
end

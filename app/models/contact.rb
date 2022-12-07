class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, presence: true
  validates :friend_id, presence: true

  validate :cannot_friend_self
  # validate :friendship_already_exists

  def cannot_friend_self
    if user_id == friend_id
      errors.add(:user_id, "can't befriend yourself")
    end
  end

  # def friendship_already_exists
  #   f1 = Contact.find_by(user_id: user_id, friend_id: friend_id, accepted: true)
  #   f2 = Contact.find_by(user_id: friend_id, friend_id: user_id, accepted: true)
    
  #   # 1. if accepted = null, then you can update it
  #   # 2. if accepted = true, then it is a validation error
  #   # if !f1.accepted && !f2.accepted 
  #   # return error that the instance already exists
  #   # elsif f1 || f2
  #   # return error that accepted is true 
  #   # cannot create another contact where user_id is 2 and friend_id 3 OR user_id is 3 and friend_id is 2, but you should be able to update accepted from false to true
  #   if f1 || f2
  #     errors.add(:contact, "already exists")
  #   end
  # end
end

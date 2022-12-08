class ContactSerializer < ActiveModel::Serializer
  attributes :id, :contact_status
  belongs_to :user
  belongs_to :friend

  def contact_status
    # byebug
    self.object.accepted
  end

end

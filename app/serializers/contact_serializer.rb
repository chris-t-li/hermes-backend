class ContactSerializer < ActiveModel::Serializer
  attributes :id, :contact_status
  belongs_to :user

  def contact_status
    self.object.accepted
  end

end

class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :sender

  def sender
    self.object.user.username
  end
end

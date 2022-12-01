class ConversationThreadSerializer < ActiveModel::Serializer
  attributes :id, :title, :messages
end

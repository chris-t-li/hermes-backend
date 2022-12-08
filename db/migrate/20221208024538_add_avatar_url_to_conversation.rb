class AddAvatarUrlToConversation < ActiveRecord::Migration[7.0]
  def change
    add_column :conversations, :convo_url, :string
  end
end

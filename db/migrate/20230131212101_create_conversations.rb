class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.string :title
      t.string :convo_url

      t.timestamps
    end
  end
end

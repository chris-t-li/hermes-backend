class CreateMessageReceivers < ActiveRecord::Migration[7.0]
  def change
    create_table :message_receivers do |t|
      t.belongs_to :message, null: false, foreign_key: true
      t.belongs_to :receiver, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, references: :users, foreign_key: { to_table: :users}
      t.boolean :accepted

      t.timestamps
    end
  end
end

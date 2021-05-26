class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :sender_id, index: true, foreign_key: { to_table: :user }
      t.integer :recipient_id, index: true, foreign_key: { to_table: :user }
      t.text :message

      t.timestamps
    end
  end
end

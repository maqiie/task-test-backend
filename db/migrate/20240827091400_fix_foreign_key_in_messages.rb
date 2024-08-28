class FixForeignKeyInMessages < ActiveRecord::Migration[6.0]
  def change
    # Drop the incorrect foreign key
    remove_foreign_key :messages, column: :chatroom_id

    # Add the correct foreign key
    add_foreign_key :messages, :chatrooms, column: :chatroom_id
  end
end

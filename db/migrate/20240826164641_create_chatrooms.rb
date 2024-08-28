# db/migrate/xxxxxx_create_chatrooms.rb
class CreateChatrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chatrooms do |t|
      t.references :user1, foreign_key: { to_table: :users }
      t.references :user2, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

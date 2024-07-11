class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :status

      t.timestamps
    end
  end
end

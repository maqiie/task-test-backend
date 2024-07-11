class AddReceiverIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :receiver_id, :integer
    add_index :users, :receiver_id
  end
end

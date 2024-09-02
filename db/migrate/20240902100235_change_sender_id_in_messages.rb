class ChangeSenderIdInMessages < ActiveRecord::Migration[6.0]
  def change
    change_column_null :messages, :sender_id, false
    add_foreign_key :messages, :users, column: :sender_id
  end
end

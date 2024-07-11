class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.references :reminder, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true  # Change receiver_id to user_id
      t.string :status

      t.timestamps
    end
  end
end

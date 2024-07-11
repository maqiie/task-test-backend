class CreateReminderUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :reminder_users do |t|
      t.references :reminder, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :relationship_category, default: 0

      t.timestamps
    end

    add_index :reminder_users, [:reminder_id, :user_id], unique: true
  end
end

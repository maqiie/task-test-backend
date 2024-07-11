class AddReminderIdToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :reminder_id, :integer
  end
end

class AddCalendarIdToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :calendar_id, :integer
  end
end

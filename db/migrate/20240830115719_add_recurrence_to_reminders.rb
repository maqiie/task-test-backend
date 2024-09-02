class AddRecurrenceToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :recurrence_frequency, :string
    add_column :reminders, :recurrence_interval, :integer
  end
end

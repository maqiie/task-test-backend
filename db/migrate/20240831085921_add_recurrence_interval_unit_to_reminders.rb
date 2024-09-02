class AddRecurrenceIntervalUnitToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :recurrence_interval_unit, :string
  end
end

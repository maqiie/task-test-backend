class AddRepeatIntervalToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :repeat_interval, :integer
  end
end

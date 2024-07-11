class AddRepeatIntervalUnitToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :repeat_interval_unit, :string
  end
end

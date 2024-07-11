class AddDurationToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :duration, :string
  end
end

class AddCompletedToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :completed, :boolean
  end
end

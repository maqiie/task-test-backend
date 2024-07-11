class AddLocationAndPriorityToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :location, :string
    add_column :reminders, :priority, :string
  end
end

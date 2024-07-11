class AddLabelToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :label, :string
  end
end


class AddSpecialEventsToReminders < ActiveRecord::Migration[6.1]
  def change
    add_column :reminders, :occasion, :string
    add_column :reminders, :is_special_event, :boolean, default: false
  end
end

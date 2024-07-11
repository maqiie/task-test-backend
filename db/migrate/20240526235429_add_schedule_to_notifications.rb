class AddScheduleToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :schedule, :string
  end
end

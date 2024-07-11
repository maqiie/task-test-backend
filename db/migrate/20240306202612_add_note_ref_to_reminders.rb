class AddNoteRefToReminders < ActiveRecord::Migration[6.0]
  def change
    add_reference :reminders, :note, foreign_key: true
  end
end

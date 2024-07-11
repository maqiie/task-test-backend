class ReminderUser < ApplicationRecord
  belongs_to :reminder
  belongs_to :user

  enum relationship_category: { family: 0, friend: 1, colleague: 2 }
  validates :user_id, :reminder_id, presence: true

end

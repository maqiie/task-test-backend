
class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :reminder, optional: false # Ensure reminder is always present

  scope :upcoming, -> { where('schedule >= ?', Time.current) }
  validates :message, :schedule, :created_at, presence: true
  validates :created_at, presence: true

end

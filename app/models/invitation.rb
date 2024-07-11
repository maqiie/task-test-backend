class Invitation < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :reminder, optional: true
  belongs_to :user
  validates :user_id, presence: true
  validates :reminder_id, presence: true
  validates :status, presence: true
  validates :reminder, presence: true  # Ensure this line exists
  validates :user_id, uniqueness: { scope: :reminder_id } # Ensure unique invitation per user for a reminder
  validates :status, inclusion: { in: %w[pending accepted declined] }
  
  after_update_commit { broadcast_update }
  private

  def broadcast_update
    ActionCable.server.broadcast('invitations_channel', self)
  end
end

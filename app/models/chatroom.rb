class Chatroom < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'
  has_many :messages
  has_many :users, through: :messages

  # def self.between(user1_id, user2_id)
  #   where(
  #     '(user1_id = ? AND user2_id = ?) OR (user1_id = ? AND user2_id = ?)',
  #     user1_id, user2_id, user2_id, user1_id
  #   ).first
  # end
  def self.between(user1_id, user2_id)
    where(user1_id: user1_id, user2_id: user2_id)
      .or(where(user1_id: user2_id, user2_id: user1_id))
  end
  
end

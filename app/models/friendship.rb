
  class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, class_name: "User"
    enum relationship_category: { family: 0, friend: 1, colleague: 2 }
    validates :user_id, :friend_id, :relationship_category, presence: true

    validates :status, inclusion: { in: ['pending', 'accepted', 'declined'] }

  end
  
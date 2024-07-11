
  class FriendRequest < ApplicationRecord
    belongs_to :sender, class_name: 'User'
    belongs_to :receiver, class_name: 'User'
    
    enum relationship_category: { family: 0, friend: 1, colleague: 2 }
  
    def as_json(options = {})
      super(options).merge(relationship_category: relationship_category)
    end
  end
  
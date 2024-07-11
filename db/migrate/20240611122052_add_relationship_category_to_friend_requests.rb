class AddRelationshipCategoryToFriendRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :friend_requests, :relationship_category, :integer
  end
end

class AddRelationshipCategoryToFriendships < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :relationship_category, :integer
  end
end

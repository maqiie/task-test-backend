class AddSenderIdToInvitations < ActiveRecord::Migration[7.0]
  def change
    add_column :invitations, :sender_id, :integer
  end
end

class RenameChatRoomIdInMessages < ActiveRecord::Migration[6.0]
  def change
    rename_column :messages, :chat_room_id, :chatroom_id
  end
end


# class ChatChannel < ApplicationCable::Channel
#   def subscribed
#     chatroom = Chatroom.find_by(id: params[:chatroom_id])
#     if chatroom
#       stream_for chatroom
#     else
#       reject
#     end
#   end

#   def send_message(data)
#     chatroom = Chatroom.find_by(id: data['chatroom_id'])
#     if chatroom
#       message = chatroom.messages.create!(
#         content: data['content'],
#         user_id: data['sender_id']
#       )
#       ChatChannel.broadcast_to(chatroom, message: message)
#     else
#       reject
#     end
#   end
# end


class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:chatroom_id]}"
  end

  def send_message(data)
    chatroom = Chatroom.find(params['chatroom_id'])
    message = chatroom.messages.create!(
      content: data['content'],
      user_id: data['sender_id']
    )
    ActionCable.server.broadcast "chat_#{chatroom.id}", message: message_json(message)
  end

  private

  def message_json(message)
    {
      id: message.id,
      content: message.content,
      user: {
        id: message.user.id,
        name: message.user.name
      },
      created_at: message.created_at
    }
  end
end

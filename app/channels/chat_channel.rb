

# class ChatChannel < ApplicationCable::Channel
#   def subscribed
#     stream_from "chat_#{params[:chatroom_id]}"
#   end

#   def send_message(data)
#     chatroom = Chatroom.find(params['chatroom_id'])
#     message = chatroom.messages.create!(
#       content: data['content'],
#       user_id: data['sender_id']
#     )
#     ActionCable.server.broadcast "chat_#{chatroom.id}", message: message_json(message)
#   end

#   private

#   def message_json(message)
#     {
#       id: message.id,
#       content: message.content,
#       user: {
#         id: message.user.id,
#         name: message.user.name
#       },
#       created_at: message.created_at
#     }
#   end
# end


class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:chatroom_id]}"
  end

  def send_message(data)
    chatroom = Chatroom.find(params['chatroom_id'])
    sender_id = data['sender_id']
    content = data['content']

    # Ensure sender_id is present and valid
    if sender_id.present? && User.exists?(sender_id)
      message = chatroom.messages.create!(
        content: content,
        user_id: sender_id,  # Assign sender_id to user_id
        sender_id: sender_id # Assign sender_id explicitly
      )
      ActionCable.server.broadcast "chat_#{chatroom.id}", message: message_json(message)
    else
      # Handle invalid sender_id
      Rails.logger.error("Invalid sender_id: #{sender_id}")
    end
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

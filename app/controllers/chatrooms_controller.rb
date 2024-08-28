
class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def check_or_create
    user2 = User.find(params[:user2_id])
    chatroom = Chatroom.find_by(user1: current_user, user2: user2) ||
               Chatroom.find_by(user1: user2, user2: current_user)

    unless chatroom
      chatroom = Chatroom.create(user1: current_user, user2: user2)
    end

    render json: chatroom
  end



  def messages
    chatroom = Chatroom.find(params[:id])
    if chatroom
      messages = chatroom.messages.order(created_at: :desc)
      render json: messages
    else
      render json: { error: 'Chatroom not found' }, status: :not_found
    end
  end
end

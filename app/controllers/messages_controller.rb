
class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat_room, only: [:create, :index, :messages]

  
  def create
    if @chat_room.users.include?(current_user)
      message = @chat_room.messages.create!(message_params.merge(user: current_user))
      ChatChannel.broadcast_to(@chat_room, message: render_message(message))
      head :ok
    else
      render json: { error: 'Not authorized' }, status: :forbidden
    end
  rescue StandardError => e
    logger.error("Error creating message: #{e.message}")
    render json: { error: 'Internal Server Error' }, status: :internal_server_error
  end
  
  def messages
    if @chat_room
      @messages = @chat_room.messages.includes(:user).order(:created_at)
      if @messages.any?
        render json: @messages.as_json(only: [:id, :content, :created_at, :user_id]).map do |message|
          message.merge('type' => message['user_id'] == current_user.id ? 'sent' : 'received')
        end
      else
        render json: { message: 'No messages found' }, status: :no_content
      end
    else
      render json: { error: 'Chatroom not found' }, status: :not_found
    end
  end
  

  def index
    if @chat_room
      messages = @chat_room.messages.order(:created_at)
      render json: messages.as_json(only: [:id, :content, :created_at, :user_id]).map do |message|
        message.merge('type' => message['user_id'] == current_user.id ? 'sent' : 'received')
      end
    else
      render json: { error: 'Chat room not found' }, status: :not_found
    end
  end

  def unread_count
    begin
      unread_messages = Message.where(user_id: current_user.id, read: false)
      response_data = {
        unread_count: unread_messages.count,
        messages: unread_messages.as_json(only: [:id, :content, :created_at])
      }
      render json: response_data
    rescue StandardError => e
      logger.error("Error fetching unread messages: #{e.message}")
      render json: { error: 'Internal Server Error' }, status: :internal_server_error
    end
  end

  private

  def set_chat_room
    @chat_room = Chatroom.find_by(id: params[:chat_room_id] || params[:id])
    unless @chat_room
      render json: { error: 'Chat room not found' }, status: :not_found
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def render_message(message)
    {
      id: message.id,
      content: message.content,
      created_at: message.created_at,
      type: message.user_id == current_user.id ? 'sent' : 'received'
    }
  end
  
end

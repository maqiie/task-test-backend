
class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @chat_room = Chatroom.find(params[:chatroom_id])
    if @chat_room
      @messages = @chat_room.messages.includes(:user).order(:created_at)
      render json: @messages.as_json(
        only: [:id, :content, :created_at, :user_id],
        include: { user: { only: [:id, :name] } }
      ).map do |message|
        message.merge('type' => message['user']['id'] == current_user.id ? 'sent' : 'received')
      end
    else
      render json: { error: 'Chatroom not found' }, status: :not_found
    end
  end

  def create
    @message = current_user.sent_messages.new(message_params)
    @message.sender = current_user
  
    if @message.save
      render json: @message.as_json(
        only: [:id, :content, :created_at, :user_id],
        include: { user: { only: [:id, :name] } }
      )
    else
      render json: { error: @message.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end

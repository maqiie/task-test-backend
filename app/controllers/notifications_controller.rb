

# class NotificationsController < ApplicationController
#   before_action :authenticate_user!

#   # Broadcasts a notification to a specific user
#   def broadcast
#     user = User.find_by(id: params[:user_id])
    
#     if user
#       notification = { message: "Test notification", id: SecureRandom.uuid }
#       NotificationsChannel.broadcast_to(user, notification)
#       render json: { status: 'Notification sent' }, status: :ok
#     else
#       render json: { error: 'User not found' }, status: :not_found
#     end
#   end

#   # Retrieves notifications for the current user
#   def index
#     @notifications = current_user.notifications

#     # Safely filter notifications with a due_date in the future
#     filtered_notifications = @notifications.select do |notification|
#       notification.reminder&.due_date&.future?
#     end

#     render json: { notifications: filtered_notifications }
#   rescue => e
#     logger.error "Failed to fetch notifications for user #{current_user.id}: #{e.message}"
#     render json: { error: 'Failed to fetch notifications' }, status: :internal_server_error
#   end

#   # Sends a notification email to a specified recipient
#   def send_notification_email
#     recipient = params[:recipient]
#     message = params[:message]

#     if recipient.present? && message.present?
#       begin
#         NotificationMailer.notification_email(recipient, "Notification Subject", message).deliver_now
#         render json: { message: "Notification email sent successfully" }, status: :ok
#       rescue StandardError => e
#         logger.error "Failed to send notification email: #{e.message}\n#{e.backtrace.join("\n")}"
#         render json: { error: "Failed to send notification email: #{e.message}" }, status: :internal_server_error
#       end
#     else
#       render json: { error: 'Recipient and message are required' }, status: :unprocessable_entity
#     end
#   end
# end
class NotificationsController < ApplicationController
  before_action :authenticate_user!

  # Broadcasts a notification to a specific user
  def broadcast
    user = User.find_by(id: params[:user_id])
    
    if user && can_broadcast_to?(user)
      notification = { message: "Test notification", id: SecureRandom.uuid }
      NotificationsChannel.broadcast_to(user, notification)
      render json: { status: 'Notification sent' }, status: :ok
    else
      render json: { error: 'User not found or not authorized' }, status: :not_found
    end
  end

  # Retrieves notifications for the current user
  def index
    @notifications = current_user.notifications

    # Safely filter notifications with a due_date in the future
    filtered_notifications = @notifications.select do |notification|
      notification.reminder&.due_date&.future?
    end

    render json: { notifications: filtered_notifications }
  rescue => e
    logger.error "Failed to fetch notifications for user #{current_user.id}: #{e.message}\n#{e.backtrace.join("\n")}"
    render json: { error: 'Failed to fetch notifications', details: e.message }, status: :internal_server_error
  end

  # Sends a notification email to a specified recipient
  def send_notification_email
    recipient = params[:recipient]
    message = params[:message]

    if recipient.present? && message.present?
      begin
        NotificationMailer.notification_email(recipient, "Notification Subject", message).deliver_now
        render json: { message: "Notification email sent successfully" }, status: :ok
      rescue StandardError => e
        logger.error "Failed to send notification email: #{e.message}\n#{e.backtrace.join("\n")}"
        render json: { error: "Failed to send notification email", details: e.message }, status: :internal_server_error
      end
    else
      render json: { error: 'Recipient and message are required' }, status: :unprocessable_entity
    end
  end

  private

  # Example authorization check method
  def can_broadcast_to?(user)
    # Implement your authorization logic here
    # Example: Allow broadcast only if the current user is an admin or has special permissions
    current_user.admin? || current_user.has_permission_to_notify?(user)
  end
end

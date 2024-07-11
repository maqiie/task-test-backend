# app/services/notification_service.rb
class NotificationService
    def self.notify(user, message)
      Notification.create(user: user, message: message)
    end
  
    def self.schedule_recurring_notification(user, message, reminder_time)
      # Calculate the time until the reminder_time
      time_until_reminder = reminder_time - Time.now
  
      # Check if the reminder time is within an hour
      if time_until_reminder > 0 && time_until_reminder <= 3600
        # Schedule recurring notifications every 15 minutes until the reminder time
        while time_until_reminder > 900 do
          # Calculate the time for the next notification (15 minutes later)
          next_notification_time = Time.now + 900
  
          # Schedule the notification
          Notification.create(user: user, message: message, scheduled_at: next_notification_time)
  
          # Update the time until the reminder time
          time_until_reminder = reminder_time - next_notification_time
        end
      end
  
      # Schedule an additional notification 24 hours before the reminder time
      if time_until_reminder > 86400 # 24 hours in seconds
        notification_time_24h_before = reminder_time - 86400
        Notification.create(user: user, message: message, scheduled_at: notification_time_24h_before)
      end
    end
  end
  
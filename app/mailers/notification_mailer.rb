# app/mailers/notification_mailer.rb
# class NotificationMailer < ApplicationMailer
#   def notification_email(recipient, subject, message)
#     @message = message.presence || "No message provided"
#     mail(to: recipient, subject: subject.presence || "No Subject")
#   end
# end
class NotificationMailer < ApplicationMailer
  def notification_email(user, subject, message)
    @user_name = user.name
    @message = message.presence || "No message provided"
    mail(to: user.email, subject: subject.presence || "No Subject")
  end
end

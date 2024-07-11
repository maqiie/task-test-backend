class FriendRequestMailer < ApplicationMailer
  def request_received_email(friend_request)
    @friend_request = friend_request
    @receiver = @friend_request.receiver
    @sender = @friend_request.sender
    mail(to: @receiver.email, subject: 'Friend Request Received')
  end

  def request_accepted_email(friend_request)
    @friend_request = friend_request
    @receiver = @friend_request.receiver
    @sender = @friend_request.sender
    mail(to: @sender.email, subject: 'Friend Request Accepted')
  end

  def request_declined_email(friend_request)
    @friend_request = friend_request
    @receiver = @friend_request.receiver
    @sender = @friend_request.sender
    mail(to: @sender.email, subject: 'Friend Request Declined')
  end
end

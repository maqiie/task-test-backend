class InvitationMailer < ApplicationMailer
  def invitation_email(invitation)
    @invitation = invitation
    @sender = invitation.sender # Assuming invitation.sender is the sender of the invitation
    @receiver = invitation.user # Assuming invitation.user is the receiver of the invitation

    mail(to: @receiver.email, subject: 'Invitation to Team Meeting')
  end
end

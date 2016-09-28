class EventMailer < ApplicationMailer

  def creation_confirmation(event)
    @event = event
    mail(
      to:       @event.user.email,
      subject:  "Event #{@event.name} created!"
    )
  end

end

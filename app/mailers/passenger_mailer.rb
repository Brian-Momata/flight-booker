class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirmation_email
    # Save a list of passengers to a variable
    @passengers = params[:passengers]

    # Send a confimation email to all the passengers
    @passengers.each do |passenger|
      mail(to: passenger.email, subject: 'Booking Created')
    end
  end
end

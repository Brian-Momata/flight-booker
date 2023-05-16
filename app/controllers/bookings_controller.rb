class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    params[:flight][:num_passengers].to_i.times do
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flight_id = params[:booking][:flight_id]

    respond_to do |format|
      if @booking.save
        # tell PassengerMailer to send confirmation email after a save
        PassengerMailer.with(passengers: @booking.passengers, booking: @booking)
        .confirmation_email
        .deliver_now

        format.html { redirect_to(@booking, success: 'Booking successfully created') }
        format.json { render json: @booking }
      else
        format.html { render action: 'new', error: 'Something went wrong' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @booking = Booking.find(params[:id])
  end
  
  private
  
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end

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
    if @booking.save
      flash[:success] = "Object successfully created"
      redirect_to @booking
    else
      flash[:error] = "Something went wrong"
      render 'new'
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

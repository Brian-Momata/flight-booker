class FlightsController < ApplicationController
  def index
    @departure_airports = Flight.all.map { |f| [f.departure_airport.code, f.departure_airport.id] }
    @arrival_airports = Flight.all.map { |f| [f.arrival_airport.code, f.arrival_airport.id] }
    @flights = Flight.where("departure_airport = ?", params[:departure_code])
                    .where("arrival_airport = ?", params[:arrival_code])
                    .where("date(start) = ?", params[:date].to_date)
  end
end

class Airport < ApplicationRecord
  has_many :departing_flights, class_name: "Flight", foreign_key: "departure_airport"
  has_many :arriving_flights, class_name: "Flight", foreign_key: "arrival_airport"


  # collecting start values for all departing flights
  def self.departure_times
    Airport.all.map { |a| a.departing_flights.pluck(:start) }.select { |array| !array.empty? }.flatten(1)
  end
end

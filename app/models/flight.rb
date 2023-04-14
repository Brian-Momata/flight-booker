class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_airport"
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_airport"

  has_many :bookings
  has_many :passengers, through: :bookings, source: :bookings_table_foreign_key_to_passengers_table
end

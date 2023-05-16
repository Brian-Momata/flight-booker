require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create 10 Airport objects
10.times do
  Airport.create(code: Faker::Travel::Airport.iata(size: 'large', region: 'united_states'))
end
# Get all airports
airports = Airport.all

# Create 150 Flight objects
150.times do
  departure_airport = airports.sample
  arrival_airport = airports.sample
  start = Faker::Time.between(from:  DateTime.now, to: DateTime.now + 5)
  duration = rand(1..10)

  Flight.create(
    departure_airport: departure_airport,
    arrival_airport: arrival_airport,
    start: start,
    duration: duration
  )
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create airports
airport1 = Airport.create(code: "AAR")
airport2 = Airport.create(code: "ABD")
airport3 = Airport.create(code: "EZE")
airport4 = Airport.create(code: "BJM")
airport5 = Airport.create(code: "BUQ")
airport6 = Airport.create(code: "DXB")
airport7 = Airport.create(code: "DUS")

# Create flights with associations to airports
Flight.create(departure_airport: airport1, arrival_airport: airport2, start:"2023-05-01 12:34:56", duration: 2)
Flight.create(departure_airport: airport3, arrival_airport: airport1, start:"2023-05-15 09:15:30", duration: 1)
Flight.create(departure_airport: airport5, arrival_airport: airport7, start:"2023-04-10 18:45:00", duration: 4)
Flight.create(departure_airport: airport4, arrival_airport: airport6, start:"2023-04-20 15:30:45", duration: 5)
Flight.create(departure_airport: airport6, arrival_airport: airport3, start:"2023-05-05 08:00:00", duration: 3)
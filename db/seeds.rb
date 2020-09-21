# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@airline_1 = Airline.create!(name: 'Southwest')
@airline_2 = Airline.create!(name: 'United')
@flight_1 = @airline_1.flights.create!(number: '1000')
@flight_2 = @airline_2.flights.create!(number: '2000')
@flight_3 = @airline_2.flights.create!(number: '3000')
@passenger_1 = Passenger.create!(name: 'Dan')
@passenger_2 = Passenger.create!(name: 'Brian')
@passenger_3 = Passenger.create!(name: 'Tim')
FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_1.id)
FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_2.id)
FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_3.id)
FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @passenger_1.id)
FlightPassenger.create!(flight_id: @flight_3.id, passenger_id: @passenger_1.id)

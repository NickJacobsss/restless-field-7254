# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
  FlightPassenger.destroy_all
  Airline.destroy_all
  Flight.destroy_all
  Passenger.destroy_all

  @united = Airline.create!(name: "United Airlines")
  @flight1 = @united.flights.create!(number: 1234, date: "01-01-2020", departure_city: "Denver", arrival_city: "Dayton")
  @flight2 = @united.flights.create!(number: 5678, date: "01-01-2021", departure_city: "Baton Rouge", arrival_city: "New Orleans")
  @nick = Passenger.create!(name: "Nick", age: 31)
  @mike = Passenger.create(name: "MikeDao", age: 99)
  @jenn = Passenger.create(name: "Squirrel Girl", age: 17)
  FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @nick.id)
  FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @mike.id)
  FlightPassenger.create(flight_id: @flight1.id, passenger_id: @jenn.id)

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

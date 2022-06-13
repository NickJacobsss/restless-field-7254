require 'rails_helper'

RSpec.describe Flight, type: :model do
  it { should belong_to :airline }

  it "only shows passengers 18 and over" do
    Airline.destroy_all
    @united = Airline.create!(name: "United Airlines")
    @flight1 = @united.flights.create!(number: 1234, date: "01-01-2020", departure_city: "Denver", arrival_city: "Dayton")
    @nick = Passenger.create!(name: "Nick", age: 31)
    @mike = Passenger.create(name: "MikeDao", age: 99)
    @jenn = Passenger.create(name: "Squirrel Girl", age: 17)
    FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @nick.id)
    FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @mike.id)
    FlightPassenger.create(flight_id: @flight1.id, passenger_id: @jenn.id)

    expect(@flight1.adults_only).to eq([@nick, @mike])
  end
end

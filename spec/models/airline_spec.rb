require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do

    it { should have_many :flights }
    it { should have_many(:passengers).through(:flights) }

  end

  describe 'methods' do
    before :each do

      @airline_1 = Airline.create!(name: 'Southwest')
      @airline_2 = Airline.create!(name: 'United')
      @flight_1 = @airline_1.flights.create!(number: '1000')
      @flight_2 = @airline_2.flights.create!(number: '2000')
      @flight_3 = @airline_1.flights.create!(number: '3000')
      @passenger_1 = Passenger.create!(name: 'Dan')
      @passenger_2 = Passenger.create!(name: 'Brian')
      @passenger_3 = Passenger.create!(name: 'Tim')
      FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_1.id)
      FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_2.id)
      FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_3.id)
      FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @passenger_1.id)
      FlightPassenger.create!(flight_id: @flight_3.id, passenger_id: @passenger_3.id)

    end

    it 'shows a unique list of passenger names from that airline' do

      expect(@airline_1.unique_passengers).to eq(['Brian', 'Dan', 'Tim'])

    end
  end
end

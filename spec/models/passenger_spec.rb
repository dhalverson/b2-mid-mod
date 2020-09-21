require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'relationships' do

    it { should have_many :flight_passengers }
    it { should have_many(:flights).through(:flight_passengers) }

  end

  describe 'methods' do
    before :each do

      @airline_1 = Airline.create!(name: 'Southwest')
      @flight_1 = @airline_1.flights.create!(number: '1000')
      @passenger_1 = Passenger.create!(name: 'Dan')
      @passenger_2 = Passenger.create!(name: 'Brian')
      @passenger_3 = Passenger.create!(name: 'Tim')
      FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_1.id)
      FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_2.id)
      FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_2.id)

    end

    it 'can count the number of flights a passenger has' do

      expect(@passenger_1.flight_count).to eq(1)
      expect(@passenger_2.flight_count).to eq(2)
      expect(@passenger_3.flight_count).to eq(0)

    end
  end
end

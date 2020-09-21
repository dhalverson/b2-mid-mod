require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'relationships' do

    it { should belong_to :airline }
    it { should have_many :flight_passengers }
    it { should have_many(:passengers).through(:flight_passengers) }

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
      FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_3.id)

    end

    it 'removes a passenger from a flight' do

      expect(@flight_1.passengers).to eq([@passenger_1, @passenger_2, @passenger_3])
      @flight_1.remove_passenger(@passenger_3)
      @flight_1.reload
      expect(@flight_1.passengers).to eq([@passenger_1, @passenger_2])

    end
  end
end

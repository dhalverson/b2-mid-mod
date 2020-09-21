require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a flights index page' do
    before :each do

      @airline_1 = Airline.create!(name: 'Southwest')
      @airline_2 = Airline.create!(name: 'United')
      @flight_1 = @airline_1.flights.create!(number: '1000')
      @flight_2 = @airline_2.flights.create!(number: '2000')
      @passenger_1 = Passenger.create!(name: 'Dan')
      @passenger_2 = Passenger.create!(name: 'Brian')
      @passenger_3 = Passenger.create!(name: 'Tim')
      FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_1.id)
      FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_2.id)
      FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_3.id)
      FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @passenger_1.id)

    end

    it 'I see a list of all flight numbers' do
      visit('/flights')
      expect(page).to have_content(@flight_1.number)
      expect(page).to have_content(@flight_2.number)
    end

    it 'Under each flight number I see the names of all that flights passengers' do
      visit('/flights')
      within "#flight-#{@flight_1.id}" do
        @flight_1.passengers.each do |passenger|
          expect(page).to have_content(passenger.name)
        end
      end
    end
  end
end

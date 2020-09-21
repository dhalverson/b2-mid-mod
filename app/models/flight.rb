class Flight < ApplicationRecord

  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def remove_passenger(passenger)
    flight_passenger = flight_passengers.find_by(passenger_id: passenger.id)
    flight_passenger.destroy
  end
end

class ParkingLot < ApplicationRecord
  has_many :entrances, dependent: :destroy
  has_many :spots, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :cars, through: :tickets
end

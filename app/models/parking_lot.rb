class ParkingLot < ApplicationRecord
  has_many :entrances, dependent: :destroy
  has_many :spots, dependent: :destroy
end

class ParkingLot < ApplicationRecord
  has_many :entrances, dependent: :destroy
end

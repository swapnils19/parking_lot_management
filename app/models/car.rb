class Car < ApplicationRecord
  has_one :ticket
  has_one :parking_lot, through: :ticket

  def self.unparked_cars
    where.not(id: parked_cars.ids)
  end

  def self.parked_cars
    joins(:ticket).distinct
  end
end

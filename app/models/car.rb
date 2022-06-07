class Car < ApplicationRecord
  has_one :ticket
  has_one :parking_lot, through: :ticket
end

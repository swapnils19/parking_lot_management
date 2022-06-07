class Ticket < ApplicationRecord
  belongs_to :parking_lot
  belongs_to :car, required: true
  belongs_to :spot, required: true
end

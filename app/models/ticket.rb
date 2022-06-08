class Ticket < ApplicationRecord
  belongs_to :parking_lot
  belongs_to :car, required: true
  belongs_to :spot, required: true

  after_save :update_spot

  private

  def update_spot
    spot.update({available: false})
  end
end

class Ticket < ApplicationRecord
  belongs_to :parking_lot
  belongs_to :car, required: true
  belongs_to :spot, required: true
  has_one :floor, through: :spot

  after_save :update_spot

  private

  def update_spot
    spot.update({available: false})
  end
end

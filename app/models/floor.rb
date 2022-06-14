class Floor < ApplicationRecord
  belongs_to :parking_lot
  has_many :spots, dependent: :destroy

  validate :max_spots, on: :create

  private

  def max_spots
    errors.add(:max_spots, 'exceeded Parking Lot Max Spots limit!') if max_spots > parking_lot.max_spots
  end
end

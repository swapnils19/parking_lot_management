# frozen_string_literal: true

class Spot < ApplicationRecord
  belongs_to :parking_lot
  belongs_to :nearest_entrance, class_name: 'Entrance', foreign_key: 'entrance_id'

  validate :max_spots, on: :create

  def self.free_spots(parking_lot)
    where(available: true)
      .where(parking_lot: parking_lot)
  end

  private

  def max_spots
    errors.add(:spot, "can't be created. Limit exceeded!") if parking_lot.spots.count > parking_lot.max_spots
  end
end

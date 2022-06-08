# frozen_string_literal: true

class Spot < ApplicationRecord
  belongs_to :parking_lot
  belongs_to :nearest_entrance, class_name: 'Entrance', foreign_key: 'entrance_id'

  def self.free_spots(parking_lot)
    where(available: true)
      .where(parking_lot: parking_lot)
  end
end

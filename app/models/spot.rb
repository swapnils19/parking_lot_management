class Spot < ApplicationRecord
  belongs_to :parking_lot
  belongs_to :nearest_entrance, class_name: 'Entrance', foreign_key: 'entrance_id'
end

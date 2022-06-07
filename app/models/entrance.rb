class Entrance < ApplicationRecord
  belongs_to :parking_lot
  has_many :spots, dependent: :destroy
end

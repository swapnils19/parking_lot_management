class AddFloorToSpot < ActiveRecord::Migration[7.0]
  def change
    add_reference :spots, :floor, null: false, foreign_key: true
  end
end

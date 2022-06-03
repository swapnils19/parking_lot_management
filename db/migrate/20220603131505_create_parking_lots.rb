class CreateParkingLots < ActiveRecord::Migration[7.0]
  def change
    create_table :parking_lots do |t|
      t.integer :max_spots

      t.timestamps
    end
  end
end

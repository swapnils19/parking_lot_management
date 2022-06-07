class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.references :parking_lot, null: false, foreign_key: true
      t.references :entrance, null: false, foreign_key: true

      t.timestamps
    end
  end
end

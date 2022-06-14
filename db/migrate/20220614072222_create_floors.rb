class CreateFloors < ActiveRecord::Migration[7.0]
  def change
    create_table :floors do |t|
      t.integer :max_spots
      t.references :parking_lot, null: false, foreign_key: true

      t.timestamps
    end
  end
end

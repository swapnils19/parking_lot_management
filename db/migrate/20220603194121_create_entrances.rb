class CreateEntrances < ActiveRecord::Migration[7.0]
  def change
    create_table :entrances do |t|
      t.references :parking_lot, null: false, foreign_key: true

      t.timestamps
    end
  end
end

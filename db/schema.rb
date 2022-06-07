# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_07_184730) do
  create_table "cars", force: :cascade do |t|
    t.string "color"
    t.string "registration_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entrances", force: :cascade do |t|
    t.integer "parking_lot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parking_lot_id"], name: "index_entrances_on_parking_lot_id"
  end

  create_table "parking_lots", force: :cascade do |t|
    t.integer "max_spots"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spots", force: :cascade do |t|
    t.integer "parking_lot_id", null: false
    t.integer "entrance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entrance_id"], name: "index_spots_on_entrance_id"
    t.index ["parking_lot_id"], name: "index_spots_on_parking_lot_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "parking_lot_id", null: false
    t.integer "car_id", null: false
    t.integer "spot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_tickets_on_car_id"
    t.index ["parking_lot_id"], name: "index_tickets_on_parking_lot_id"
    t.index ["spot_id"], name: "index_tickets_on_spot_id"
  end

  add_foreign_key "entrances", "parking_lots"
  add_foreign_key "spots", "entrances"
  add_foreign_key "spots", "parking_lots"
  add_foreign_key "tickets", "cars"
  add_foreign_key "tickets", "parking_lots"
  add_foreign_key "tickets", "spots"
end

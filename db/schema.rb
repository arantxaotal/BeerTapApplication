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

ActiveRecord::Schema.define(version: 2023_10_29_190958) do

  create_table "beer_types", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.float "prize_per_litre"
    t.float "flow_volume", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "taps", charset: "latin1", force: :cascade do |t|
    t.float "total_seconds", default: 0.0
    t.datetime "start_date"
    t.datetime "finish_date"
    t.float "total_euros", default: 0.0
    t.bigint "beer_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beer_type_id"], name: "fk_rails_427eff10bf"
  end

  create_table "users", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.bigint "tap_id"
    t.integer "role_cd", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tap_id"], name: "index_users_on_tap_id"
  end

  add_foreign_key "taps", "beer_types"
  add_foreign_key "users", "taps"
end

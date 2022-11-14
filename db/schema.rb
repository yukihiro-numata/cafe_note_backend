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

ActiveRecord::Schema.define(version: 2022_11_14_143557) do

  create_table "cafe_addresses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "cafe_id", null: false
    t.string "post_code", limit: 7, null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "building"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cafe_id"], name: "index_cafe_addresses_on_cafe_id"
  end

  create_table "cafe_media", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "cafe_id", null: false
    t.integer "media_type", limit: 1, null: false
    t.text "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cafe_id"], name: "index_cafe_media_on_cafe_id"
  end

  create_table "cafes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "nearest_station", null: false
    t.string "transportation", null: false
    t.string "business_hours", null: false
    t.string "regular_holiday", null: false
    t.boolean "can_takeout", null: false
    t.boolean "has_parking", null: false
    t.boolean "has_wifi", null: false
    t.boolean "has_power_supply", null: false
    t.boolean "can_smoking", null: false
    t.string "img_path", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_cafe_archives", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cafe_id", null: false
    t.bigint "rating", null: false
    t.text "memo", null: false
    t.datetime "visited_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cafe_id"], name: "index_user_cafe_archives_on_cafe_id"
    t.index ["user_id"], name: "index_user_cafe_archives_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "firebase_uid", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "cafe_addresses", "cafes"
  add_foreign_key "cafe_media", "cafes"
  add_foreign_key "user_cafe_archives", "cafes"
  add_foreign_key "user_cafe_archives", "users"
end

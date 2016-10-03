# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160930062439) do

  create_table "images", force: :cascade do |t|
    t.string   "filename"
    t.integer  "rental_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["rental_id"], name: "index_images_on_rental_id"

  create_table "rentals", force: :cascade do |t|
    t.string   "addr_full_adress"
    t.string   "addr_street_name"
    t.integer  "addr_street_num"
    t.integer  "addr_zip"
    t.string   "addr_city"
    t.string   "addr_state"
    t.integer  "dets_beds"
    t.integer  "dets_baths"
    t.boolean  "dets_is_complex"
    t.integer  "dets_stories"
    t.boolean  "dets_company_owned"
    t.string   "dets_owner"
    t.boolean  "amen_parking"
    t.boolean  "amen_pets"
    t.boolean  "amen_washer_dryer"
    t.boolean  "amen_pool"
    t.boolean  "amen_spa"
    t.boolean  "amen_gym"
    t.boolean  "amen_dishwasher"
    t.boolean  "amen_central_air"
    t.boolean  "amen_heater"
    t.boolean  "util_gas"
    t.boolean  "util_electricity"
    t.boolean  "util_trash"
    t.boolean  "util_water"
    t.boolean  "util_tv"
    t.boolean  "util_wifi"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "overall"
    t.integer  "safety"
    t.integer  "clean"
    t.integer  "noise"
    t.integer  "price"
    t.string   "comment"
    t.integer  "rental_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["rental_id"], name: "index_reviews_on_rental_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

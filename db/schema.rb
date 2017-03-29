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

ActiveRecord::Schema.define(version: 20170329141408) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "practice_id"
    t.date     "date"
    t.time     "time"
    t.string   "reason"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "status"
  end

  add_index "appointments", ["practice_id"], name: "index_appointments_on_practice_id"
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id"

  create_table "bloodpressures", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "systolic"
    t.float    "dystolic"
    t.string   "measuredd"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bloodpressures", ["user_id"], name: "index_bloodpressures_on_user_id"

  create_table "bloodsugars", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "fasting"
    t.float    "nonfasting"
    t.string   "unit"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bloodsugars", ["user_id"], name: "index_bloodsugars_on_user_id"

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "heartbeats", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "count"
    t.date     "date"
    t.string   "msr",        default: "BPM"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "heartbeats", ["user_id"], name: "index_heartbeats_on_user_id"

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "photos", force: :cascade do |t|
    t.integer  "practice_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["practice_id"], name: "index_photos_on_practice_id"

  create_table "practices", force: :cascade do |t|
    t.string   "dr_first_name"
    t.string   "dr_last_name"
    t.integer  "experience"
    t.string   "speciality"
    t.string   "address"
    t.text     "professional_statement"
    t.boolean  "is_insurance"
    t.integer  "user_id"
    t.string   "insurance"
    t.integer  "zip_code"
    t.integer  "price"
    t.boolean  "active"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "practices", ["user_id"], name: "index_practices_on_user_id"

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reports", ["user_id"], name: "index_reports_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "star",        default: 1
    t.integer  "practice_id"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "reviews", ["practice_id"], name: "index_reviews_on_practice_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "temperatures", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "temperature"
    t.string   "measured"
    t.datetime "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "temperatures", ["user_id"], name: "index_temperatures_on_user_id"

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
    t.string   "fullname"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "phone_number"
    t.text     "description"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "weights", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "weight"
    t.string   "unitt"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "weights", ["user_id"], name: "index_weights_on_user_id"

end

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

ActiveRecord::Schema.define(version: 20150831193528) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street",     limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.integer  "zip",        limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "date_of_visit"
    t.integer  "pet_id",        limit: 4
    t.integer  "user_id",       limit: 4
    t.datetime "reminder"
    t.text     "reason",        limit: 65535
    t.integer  "doctor_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appointments", ["doctor_id"], name: "index_appointments_on_doctor_id", using: :btree
  add_index "appointments", ["pet_id"], name: "index_appointments_on_pet_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "pet_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pet_types", ["name"], name: "index_pet_types_on_name", using: :btree

  create_table "pets", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "pet_type_id", limit: 255
    t.string   "breed",       limit: 255
    t.integer  "age",         limit: 4
    t.integer  "weight",      limit: 4
    t.datetime "last_visit"
    t.integer  "user_id",     limit: 4
    t.integer  "doctor_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pets", ["doctor_id"], name: "index_pets_on_doctor_id", using: :btree
  add_index "pets", ["name"], name: "index_pets_on_name", using: :btree
  add_index "pets", ["pet_type_id"], name: "index_pets_on_pet_type_id", using: :btree
  add_index "pets", ["user_id"], name: "index_pets_on_user_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.string   "school",         limit: 255
    t.integer  "years_practice", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255, default: "Customer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "role_id",                limit: 4
    t.string   "contact_number",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

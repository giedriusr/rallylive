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

ActiveRecord::Schema.define(version: 20130611122752) do

  create_table "rallies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "surface"
    t.string   "starts_at"
    t.string   "logo"
    t.boolean  "is_current",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rallies", ["is_current"], name: "index_rallies_on_is_current", using: :btree

  create_table "rally_event_retirements", force: true do |t|
    t.integer  "rally_id"
    t.integer  "participant_id"
    t.integer  "stage_id"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rally_event_retirements", ["participant_id"], name: "index_rally_event_retirements_on_participant_id", using: :btree
  add_index "rally_event_retirements", ["rally_id"], name: "index_rally_event_retirements_on_rally_id", using: :btree
  add_index "rally_event_retirements", ["stage_id"], name: "index_rally_event_retirements_on_stage_id", using: :btree

  create_table "rally_event_stage_times", force: true do |t|
    t.integer  "rally_id"
    t.integer  "stage_id"
    t.integer  "participant_id"
    t.integer  "stage_number"
    t.float    "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "penalty_in_seconds"
  end

  add_index "rally_event_stage_times", ["participant_id"], name: "index_rally_event_stage_times_on_participant_id", using: :btree
  add_index "rally_event_stage_times", ["rally_id"], name: "index_rally_event_stage_times_on_rally_id", using: :btree
  add_index "rally_event_stage_times", ["stage_id"], name: "index_rally_event_stage_times_on_stage_id", using: :btree
  add_index "rally_event_stage_times", ["stage_number"], name: "index_rally_event_stage_times_on_stage_number", using: :btree

  create_table "rally_participants", force: true do |t|
    t.integer  "rally_id"
    t.integer  "start_number"
    t.string   "driver_name"
    t.string   "co_driver_name"
    t.string   "team_name"
    t.string   "car_name"
    t.string   "classification"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_code"
  end

  add_index "rally_participants", ["rally_id"], name: "index_rally_participants_on_rally_id", using: :btree

  create_table "rally_stages", force: true do |t|
    t.integer  "rally_id"
    t.string   "name"
    t.float    "length"
    t.integer  "number"
    t.string   "surface"
    t.string   "starts_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "closing_at"
    t.string   "opening_at"
    t.boolean  "is_current", default: false
  end

  add_index "rally_stages", ["is_current"], name: "index_rally_stages_on_is_current", using: :btree
  add_index "rally_stages", ["rally_id"], name: "index_rally_stages_on_rally_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

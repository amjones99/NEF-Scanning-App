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

ActiveRecord::Schema.define(version: 2019_03_06_202913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer "booking_reference"
    t.string "institution"
    t.integer "ticket_type"
    t.boolean "access_req"
    t.boolean "catering"
    t.boolean "attended"
    t.string "dietary_req"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "conf_id"
  end

  create_table "bookings_users", id: false, force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "user_id", null: false
    t.index ["booking_id", "user_id"], name: "index_bookings_users_on_booking_id_and_user_id"
    t.index ["user_id", "booking_id"], name: "index_bookings_users_on_user_id_and_booking_id"
  end

  create_table "conferences", force: :cascade do |t|
    t.integer "days"
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conferences_timetables", id: false, force: :cascade do |t|
    t.bigint "timetable_id", null: false
    t.bigint "conference_id", null: false
    t.index ["conference_id", "timetable_id"], name: "index_conferences_timetables_on_conference_id_and_timetable_id"
    t.index ["timetable_id", "conference_id"], name: "index_conferences_timetables_on_timetable_id_and_conference_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "speaker"
    t.string "location"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events_timetables", id: false, force: :cascade do |t|
    t.bigint "timetable_id", null: false
    t.bigint "event_id", null: false
    t.index ["event_id", "timetable_id"], name: "index_events_timetables_on_event_id_and_timetable_id"
    t.index ["timetable_id", "event_id"], name: "index_events_timetables_on_timetable_id_and_event_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "not_id"
    t.string "not_des"
    t.date "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "timetables", force: :cascade do |t|
    t.integer "conf_id"
    t.integer "event_id"
    t.integer "day_num"
    t.date "start_time"
    t.date "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.integer "access"
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

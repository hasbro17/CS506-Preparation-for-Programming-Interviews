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

ActiveRecord::Schema.define(version: 20151102025337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_pages", force: :cascade do |t|
    t.text     "link_name"
    t.text     "link"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "job_pages", ["job_id"], name: "index_job_pages_on_job_id", using: :btree

# Could not dump table "jobs" because of following StandardError
#   Unknown type 'j_status' for column 'job_status'

# Could not dump table "problems" because of following StandardError
#   Unknown type 'difficulty' for column 'difficulty_level'

# Could not dump table "solution_submissions" because of following StandardError
#   Unknown type 's_status' for column 'solution_status'

  create_table "users", force: :cascade do |t|
    t.text     "username"
    t.text     "email"
    t.text     "hashed_password"
    t.text     "first_name"
    t.text     "last_name"
    t.date     "join_date"
    t.text     "company"
    t.text     "git_accnt"
    t.text     "fb_accnt"
    t.binary   "resume_pdf"
    t.binary   "profile_pic"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "salt"
  end

  add_foreign_key "job_pages", "jobs"
  add_foreign_key "solution_submissions", "users"
end

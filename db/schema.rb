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

ActiveRecord::Schema.define(version: 20151025233100) do

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

  create_table "jobs", force: :cascade do |t|
    t.text     "job_title"
    t.text     "job_status"
    t.integer  "num_views"
    t.date     "date_posted"
    t.text     "job_description"
    t.text     "skills_required"
    t.text     "job_type"
    t.text     "role_type"
    t.text     "location"
    t.text     "company_name"
    t.binary   "company_logo_image"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "problems", force: :cascade do |t|
    t.text     "problem_title"
    t.text     "problem_area"
    t.integer  "total_score"
    t.text     "problem_description"
    t.text     "input_description"
    t.text     "output_description"
    t.text     "sample_input"
    t.text     "sample_output"
    t.float    "accomplish_rate"
    t.binary   "solution_file"
    t.text     "difficulty_level"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "solution_submissions", force: :cascade do |t|
    t.integer  "problem_id"
    t.date     "date_submitted"
    t.text     "solution_status"
    t.integer  "score"
    t.text     "language"
    t.binary   "solution_file"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "solution_submissions", ["user_id"], name: "index_solution_submissions_on_user_id", using: :btree

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

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

ActiveRecord::Schema.define(version: 20140809074118) do

  create_table "annual_summary_reports", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.integer  "year"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", force: true do |t|
    t.integer  "annual_summary_report_id"
    t.integer  "question_id"
    t.text     "answer"
    t.text     "question"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedback_sections", force: true do |t|
    t.integer  "feedback_id"
    t.text     "question"
    t.text     "answer"
    t.integer  "rating"
    t.integer  "question_type"
    t.text     "action_plan"
    t.text     "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: true do |t|
    t.integer  "user_id"
    t.integer  "from_user_id"
    t.string   "from_user_name"
    t.string   "from_user_email"
    t.integer  "status_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "from_user_role"
    t.string   "project"
    t.date     "date_requested"
  end

  create_table "questions", force: true do |t|
    t.text     "question"
    t.integer  "section_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

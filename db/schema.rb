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

ActiveRecord::Schema.define(version: 20160520073941) do

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "questions", ["organization_id"], name: "index_questions_on_organization_id"

  create_table "surveys", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "stop_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.text     "emails"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "teams", ["organization_id"], name: "index_teams_on_organization_id"

  create_table "tokens", force: :cascade do |t|
    t.string   "guid"
    t.integer  "team_id"
    t.integer  "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tokens", ["survey_id"], name: "index_tokens_on_survey_id"
  add_index "tokens", ["team_id"], name: "index_tokens_on_team_id"

  create_table "votes", force: :cascade do |t|
    t.float    "value"
    t.text     "comment"
    t.integer  "team_id"
    t.integer  "survey_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "votes", ["question_id"], name: "index_votes_on_question_id"
  add_index "votes", ["survey_id"], name: "index_votes_on_survey_id"
  add_index "votes", ["team_id"], name: "index_votes_on_team_id"

end

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

ActiveRecord::Schema.define(version: 20150715033931) do

  create_table "program_file_symbols", force: :cascade do |t|
    t.integer  "program_file_id"
    t.integer  "program_symbol_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "program_files", force: :cascade do |t|
    t.integer  "program_id"
    t.string   "name",                     limit: 255
    t.string   "path",                     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "file_type"
    t.text     "content"
    t.text     "highlighted_html_content"
  end

  create_table "program_symbols", force: :cascade do |t|
    t.integer  "program_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "label",      limit: 255
    t.string   "outline",    limit: 255
    t.string   "string",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "git_url"
  end

  create_table "subjects", force: :cascade do |t|
    t.integer  "program_id"
    t.string   "name"
    t.string   "description"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

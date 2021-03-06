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

ActiveRecord::Schema.define(version: 20150112040323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "list_items", force: true do |t|
    t.string   "text",       null: false
    t.integer  "list_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "list_items", ["list_id"], name: "index_list_items_on_list_id", using: :btree

  create_table "list_topics", force: true do |t|
    t.integer  "author_id",   null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "list_topics", ["author_id"], name: "index_list_topics_on_author_id", using: :btree
  add_index "list_topics", ["title"], name: "index_list_topics_on_title", using: :btree

  create_table "lists", force: true do |t|
    t.string   "title",         null: false
    t.integer  "author_id",     null: false
    t.integer  "list_topic_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "lists", ["author_id", "list_topic_id"], name: "index_lists_on_author_id_and_list_topic_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "session_token",   null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end

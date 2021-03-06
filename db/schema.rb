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

ActiveRecord::Schema.define(version: 20140628181255) do

  create_table "conversations", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "posts_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "follows_id"
  end

  add_index "conversations", ["follows_id"], name: "index_conversations_on_follows_id"
  add_index "conversations", ["posts_id"], name: "index_conversations_on_posts_id"
  add_index "conversations", ["user_id"], name: "index_conversations_on_user_id"

  create_table "follows", force: true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["conversation_id"], name: "index_follows_on_conversation_id"
  add_index "follows", ["user_id"], name: "index_follows_on_user_id"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["conversation_id"], name: "index_posts_on_conversation_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "user", force: true do |t|
    t.text   "about"
    t.string "location"
    t.string "email"
    t.string "image_source"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.integer  "conversations_id"
    t.integer  "posts_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "follows_id"
    t.string   "email"
    t.text     "about"
    t.string   "location"
    t.string   "image_source"
  end

  add_index "users", ["conversations_id"], name: "index_users_on_conversations_id"
  add_index "users", ["follows_id"], name: "index_users_on_follows_id"
  add_index "users", ["posts_id"], name: "index_users_on_posts_id"

end

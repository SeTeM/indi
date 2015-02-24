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

ActiveRecord::Schema.define(version: 20150224174006) do

  create_table "providers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string  "title"
    t.string  "uid",     null: false
    t.text    "raw"
  end

  add_index "providers", ["uid"], name: "index_providers_on_uid", unique: true

  create_table "tags", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "tag_id",  null: false
  end

  add_index "tags_users", ["tag_id"], name: "index_tags_users_on_tag_id"
  add_index "tags_users", ["user_id", "tag_id"], name: "index_tags_users_on_user_id_and_tag_id", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "login",      null: false
    t.string   "email",      null: false
    t.string   "about"
    t.date     "hired_at"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["login"], name: "index_users_on_login", unique: true
  add_index "users", ["token"], name: "index_users_on_token", unique: true

end

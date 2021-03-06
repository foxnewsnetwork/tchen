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

ActiveRecord::Schema.define(version: 20130731223738) do

  create_table "blogpost_tag_relationships", force: true do |t|
    t.integer "blogpost_id"
    t.integer "tag_id"
  end

  add_index "blogpost_tag_relationships", ["tag_id"], name: "index_blogpost_tag_relationships_on_tag_id", using: :btree

  create_table "blogposts", force: true do |t|
    t.string   "title"
    t.string   "external_link"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "parent_id"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree
  add_index "tags", ["parent_id"], name: "index_tags_on_parent_id", using: :btree

end

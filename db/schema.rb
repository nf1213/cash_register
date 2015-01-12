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

ActiveRecord::Schema.define(version: 20150112183400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: true do |t|
    t.string   "name",                          null: false
    t.string   "status",                        null: false
    t.string   "password",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "signed_in",     default: false
    t.integer  "restaurant_id"
  end

  create_table "items", force: true do |t|
    t.string   "name",       null: false
    t.integer  "price",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["name"], name: "index_items_on_name", unique: true, using: :btree

  create_table "modification_options", force: true do |t|
    t.integer  "item_id",         null: false
    t.integer  "modification_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modifications", force: true do |t|
    t.string   "name",       null: false
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sale_item_modifications", force: true do |t|
    t.integer  "sale_item_id",    null: false
    t.integer  "modification_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sale_items", force: true do |t|
    t.integer  "sale_id",                null: false
    t.integer  "item_id",                null: false
    t.integer  "discount",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: true do |t|
    t.integer  "total",      default: 0
    t.integer  "discount",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "current",    default: true
  end

end

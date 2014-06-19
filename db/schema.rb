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

ActiveRecord::Schema.define(version: 20140529211535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gallery_image_file_name"
    t.string   "gallery_image_content_type"
    t.integer  "gallery_image_file_size"
    t.datetime "gallery_image_updated_at"
    t.integer  "listing_id"
    t.integer  "position",                   default: 0
  end

  create_table "listings", force: true do |t|
    t.string   "code"
    t.string   "listing_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "headline"
    t.string   "sub_headline"
    t.text     "description"
    t.string   "listing_page_headline"
    t.text     "listing_page_description"
    t.string   "headline_image_file_name"
    t.string   "headline_image_content_type"
    t.integer  "headline_image_file_size"
    t.datetime "headline_image_updated_at"
    t.string   "street_address"
    t.string   "cross_streets"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.float    "bedrooms"
    t.string   "status"
    t.boolean  "publish",                     default: true
    t.string   "price"
    t.integer  "neighborhood_id"
    t.string   "user_id"
  end

  add_index "listings", ["code"], name: "index_listings_on_code", unique: true, using: :btree

  create_table "neighborhoods", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_houses", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end

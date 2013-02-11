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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130211221057) do

  create_table "authorings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authorings", ["book_id"], :name => "index_authorings_on_book_id"
  add_index "authorings", ["user_id", "book_id"], :name => "index_authorings_on_user_id_and_book_id", :unique => true
  add_index "authorings", ["user_id"], :name => "index_authorings_on_user_id"

  create_table "books", :force => true do |t|
    t.string   "title"
    t.text     "summary"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "favourites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "favourites", ["book_id"], :name => "index_favourites_on_book_id"
  add_index "favourites", ["user_id", "book_id"], :name => "index_favourites_on_user_id_and_book_id", :unique => true
  add_index "favourites", ["user_id"], :name => "index_favourites_on_user_id"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "sections", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "slug"
    t.integer  "position"
    t.integer  "book_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sections", ["book_id"], :name => "index_sections_on_book_id"
  add_index "sections", ["slug"], :name => "index_sections_on_slug"

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "expire_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "subscriptions", ["book_id"], :name => "index_subscriptions_on_book_id"
  add_index "subscriptions", ["user_id", "book_id"], :name => "index_subscriptions_on_user_id_and_book_id", :unique => true
  add_index "subscriptions", ["user_id"], :name => "index_subscriptions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name",            :default => ""
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

end

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

ActiveRecord::Schema.define(:version => 20130214120559) do

  create_table "channels", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "short_name"
    t.string   "free_or_pay"
    t.string   "xmltv_id"
    t.boolean  "black_flag"
  end

  create_table "programs", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.integer  "region_id"
    t.integer  "sport_id"
    t.integer  "channel_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "category"
    t.string   "description"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
  end

  add_index "programs", ["region_id"], :name => "index_programs_on_region_id"
  add_index "programs", ["sport_id"], :name => "index_programs_on_sport_id"

  create_table "raw_channels", :force => true do |t|
    t.string   "xmltv_id"
    t.string   "channel_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "raw_programs", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "category"
    t.string   "description"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.string   "region_name"
    t.string   "channel_xmltv_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sport_keywords", :force => true do |t|
    t.string   "rule_type"
    t.string   "value"
    t.integer  "sport_id"
    t.integer  "priority"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

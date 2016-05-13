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

ActiveRecord::Schema.define(version: 20160513043046) do

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category"
    t.string   "place"
    t.string   "person"
    t.string   "baggage"
    t.integer  "mon"
    t.integer  "tue"
    t.integer  "wed"
    t.integer  "thu"
    t.integer  "fri"
    t.integer  "sat"
    t.integer  "sun"
    t.integer  "month"
    t.date     "deadline"
  end

  create_table "todos", force: :cascade do |t|
    t.string   "contents"
    t.datetime "deadline"
    t.boolean  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

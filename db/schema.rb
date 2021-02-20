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

ActiveRecord::Schema.define(version: 2021_02_18_001923) do

  create_table "cooks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.float "protein", default: 1.0, null: false
    t.float "fat", default: 1.0, null: false
    t.float "carbon_hydrate", default: 1.0, null: false
    t.float "kcal", default: 1.0, null: false
    t.float "amount", default: 1.0, null: false
    t.string "description", null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "kcal"
    t.float "protein"
    t.float "fat"
    t.float "carbon_hydrate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

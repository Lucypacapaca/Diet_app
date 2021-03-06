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

ActiveRecord::Schema.define(version: 2021_04_03_152606) do

  create_table "cook_foods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cook_id"
    t.bigint "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cook_id"], name: "index_cook_foods_on_cook_id"
    t.index ["food_id"], name: "index_cook_foods_on_food_id"
  end

  create_table "cooks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.float "protein", default: 1.0, null: false
    t.float "fat", default: 1.0, null: false
    t.float "carbon_hydrate", default: 1.0, null: false
    t.float "kcal", default: 1.0, null: false
    t.float "amount", default: 1.0, null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.date "updated_at", null: false
    t.date "start_time"
    t.bigint "user_id", null: false
    t.datetime "select_day"
    t.index ["user_id"], name: "index_cooks_on_user_id"
  end

  create_table "foods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "kcal"
    t.float "protein"
    t.float "fat"
    t.float "carbon_hydrate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "amount"
    t.boolean "flag", default: false
  end

  create_table "recipes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.float "kcal", null: false
    t.float "protein", null: false
    t.float "fat", null: false
    t.float "carbon_hydrate", null: false
    t.float "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "recipes_foods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "food_id"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_recipes_foods_on_food_id"
    t.index ["recipe_id"], name: "index_recipes_foods_on_recipe_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.float "body_mass"
    t.float "body_fat_percentage"
    t.string "purpose"
    t.string "activity_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.float "tall"
    t.integer "age"
    t.integer "sex"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "recipes_foods", "foods"
  add_foreign_key "recipes_foods", "recipes"
end

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

ActiveRecord::Schema.define(version: 2019_08_24_081553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avatars", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "xp"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "quest_id"
    t.integer "user_review_id"
    t.integer "quest_review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quest_id"], name: "index_participations_on_quest_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "quests", force: :cascade do |t|
    t.text "description"
    t.string "mode"
    t.integer "people_wanted", default: 1
    t.bigint "category_id"
    t.string "address"
    t.date "begin_on"
    t.string "duration"
    t.string "progress", default: "Pending"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.float "latitude"
    t.float "longitude"
    t.index ["category_id"], name: "index_quests_on_category_id"
    t.index ["user_id"], name: "index_quests_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "role"
    t.string "telephone"
    t.string "photo"
    t.string "entity_photo"
    t.integer "xp", default: 0
    t.string "level"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "participations", "quests"
  add_foreign_key "participations", "users"
  add_foreign_key "quests", "categories"
  add_foreign_key "quests", "users"
end

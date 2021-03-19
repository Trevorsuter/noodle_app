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

ActiveRecord::Schema.define(version: 2021_03_19_030326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.integer "point_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score_type", default: 0
    t.bigint "winner_id"
    t.index ["winner_id"], name: "index_competitions_on_winner_id"
  end

  create_table "list_tasks", force: :cascade do |t|
    t.bigint "list_id"
    t.bigint "task_id"
    t.index ["list_id"], name: "index_list_tasks_on_list_id"
    t.index ["task_id"], name: "index_list_tasks_on_task_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "partner_requests", force: :cascade do |t|
    t.bigint "partner_id"
    t.bigint "user_id"
    t.index ["partner_id"], name: "index_partner_requests_on_partner_id"
    t.index ["user_id"], name: "index_partner_requests_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "due"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.date "birthday"
    t.bigint "partner_id"
    t.string "password_digest"
    t.index ["partner_id"], name: "index_users_on_partner_id"
  end

  add_foreign_key "competitions", "users", column: "winner_id"
  add_foreign_key "list_tasks", "lists"
  add_foreign_key "list_tasks", "tasks"
  add_foreign_key "lists", "users"
  add_foreign_key "partner_requests", "users"
  add_foreign_key "partner_requests", "users", column: "partner_id"
end

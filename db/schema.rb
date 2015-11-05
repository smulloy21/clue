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

ActiveRecord::Schema.define(version: 20151105175105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accusations", force: :cascade do |t|
    t.integer  "player_id"
    t.boolean  "correct",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "adjoining_rooms", force: :cascade do |t|
    t.integer "room_id"
    t.integer "next_room_id"
  end

  create_table "answers", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_dealings", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "cardable_id"
    t.string   "cardable_type"
    t.integer  "card_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "card_dealings", ["cardable_type", "cardable_id"], name: "index_card_dealings_on_cardable_type_and_cardable_id", using: :btree

  create_table "card_selections", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "guessable_id"
    t.string   "guessable_type"
    t.integer  "card_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "card_selections", ["guessable_type", "guessable_id"], name: "index_card_selections_on_guessable_type_and_guessable_id", using: :btree

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guesses", force: :cascade do |t|
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "game_id"
    t.string   "name"
    t.string   "img"
    t.boolean  "user",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end

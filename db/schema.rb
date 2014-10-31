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

ActiveRecord::Schema.define(version: 20141030190913) do

  create_table "games", force: true do |t|
    t.string   "name"
    t.integer  "n_territories"
    t.integer  "n_goals"
    t.boolean  "active"
    t.boolean  "in_room"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "infos"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.integer  "game_id"
    t.integer  "type"
    t.integer  "goal_id"
    t.integer  "order"
    t.integer  "color"
    t.string   "init_territories"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shots", force: true do |t|
    t.integer  "game_id"
    t.integer  "index_in_game"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

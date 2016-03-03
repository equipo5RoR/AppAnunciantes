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

ActiveRecord::Schema.define(version: 20160227122227) do

  create_table "advertisers", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "accepts_claims", limit: 4
    t.integer "puntuacion",     limit: 4
  end

  add_index "advertisers", ["id"], name: "advertisers_id_index", using: :btree

  create_table "user_claims", id: false, force: :cascade do |t|
    t.integer  "id",                 limit: 4
    t.integer  "advertiser_id",      limit: 4
    t.integer  "user_id",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_commission_id", limit: 4
  end

  add_index "user_claims", ["advertiser_id"], name: "user_claims_advertiser_id_fk", using: :btree
  add_index "user_claims", ["id"], name: "user_claims_id_index", using: :btree
  add_index "user_claims", ["user_commission_id"], name: "user_claims_user_commission_id_afk", using: :btree

  create_table "user_commissions", id: false, force: :cascade do |t|
    t.integer "id",            limit: 4
    t.decimal "amount",                  precision: 12, scale: 4
    t.date    "date"
    t.integer "paid",          limit: 4
    t.integer "user_id",       limit: 4
    t.integer "advertiser_id", limit: 4
  end

  add_index "user_commissions", ["advertiser_id"], name: "advertiser_id_index", using: :btree
  add_index "user_commissions", ["id"], name: "user_commissions_id_index", using: :btree

  add_foreign_key "user_claims", "advertisers", name: "user_claims_advertiser_id_fk"
  add_foreign_key "user_claims", "user_commissions", name: "user_claims_user_commission_id_afk"
  add_foreign_key "user_commissions", "advertisers", name: "user_commissions_advertiser_id_fk"
end

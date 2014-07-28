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

ActiveRecord::Schema.define(version: 20140725212748) do

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts_outfits", id: false, force: true do |t|
    t.integer "contact_id"
    t.integer "outfit_id"
  end

  add_index "contacts_outfits", ["contact_id", "outfit_id"], name: "index_contacts_outfits_on_contact_id_and_outfit_id"
  add_index "contacts_outfits", ["outfit_id", "contact_id"], name: "index_contacts_outfits_on_outfit_id_and_contact_id"

  create_table "outfits", force: true do |t|
    t.string   "filename"
    t.datetime "date_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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

ActiveRecord::Schema.define(version: 20131206070541) do

  create_table "company", force: true do |t|
    t.string   "name",       limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company", ["name"], name: "name_UNIQUE", unique: true, using: :btree

  create_table "customer", force: true do |t|
    t.string   "first_name",      limit: 50,  null: false
    t.string   "last_name",       limit: 50,  null: false
    t.string   "email",           limit: 100, null: false
    t.integer  "type"
    t.integer  "lead_source_id"
    t.string   "notes",           limit: 200
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "street1",         limit: 100
    t.string   "street2",         limit: 100
    t.string   "city",            limit: 45
    t.string   "state",           limit: 30
    t.string   "zip",             limit: 10
    t.string   "home_phone",      limit: 15
    t.string   "mobile_phone",    limit: 15
    t.string   "work_phone",      limit: 15
    t.string   "work_phone_ext",  limit: 10
    t.string   "fax",             limit: 15
    t.string   "pager",           limit: 15
    t.string   "misc",            limit: 200
    t.integer  "company_id"
    t.integer  "sales_person_id"
  end

  add_index "customer", ["company_id"], name: "fk_cust_company_idx", using: :btree
  add_index "customer", ["lead_source_id"], name: "fk_cust_lead_source_idx", using: :btree
  add_index "customer", ["sales_person_id"], name: "fk_sales_idx", using: :btree
  add_index "customer", ["type"], name: "fk_cust_type_idx", using: :btree

  create_table "customer_type", force: true do |t|
    t.string   "type",       limit: 100, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customer_type", ["type"], name: "type_UNIQUE", unique: true, using: :btree

  create_table "job_site", force: true do |t|
    t.string   "company_name",   limit: 100
    t.string   "contact_name",   limit: 100, null: false
    t.string   "phone",          limit: 15
    t.string   "work_phone",     limit: 15
    t.string   "work_phone_ext", limit: 10
    t.string   "mobile_phone",   limit: 15
    t.string   "fax",            limit: 15
    t.string   "pager",          limit: 15
    t.string   "street1",        limit: 100
    t.string   "street2",        limit: 100
    t.string   "city",           limit: 15
    t.string   "state",          limit: 15
    t.string   "zip",            limit: 10
    t.string   "direction",      limit: 200
    t.integer  "question_id"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "job_site", ["question_id"], name: "fk_job_site_question_idx", using: :btree

  create_table "job_site_question", force: true do |t|
    t.string   "easily_accessible",     limit: 45
    t.string   "cust_vacating_when",    limit: 45
    t.string   "parking_consideration", limit: 45
    t.string   "dumpster_loc_note",     limit: 45
    t.string   "side_garage_use",       limit: 45
    t.string   "driveway_dirt_asphalt", limit: 45
    t.string   "electrical_location",   limit: 45
    t.string   "animals_restrain",      limit: 45
    t.string   "gutter_color_noted",    limit: 45
    t.string   "landscape_concerns",    limit: 45
    t.string   "work_number_shift",     limit: 45
    t.string   "additional_notes",      limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lead_source", force: true do |t|
    t.string   "source",     limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lead_source", ["source"], name: "source_UNIQUE", unique: true, using: :btree

  create_table "sales_people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales_person", force: true do |t|
    t.string   "first_name", limit: 45
    t.string   "last_name",  limit: 45
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

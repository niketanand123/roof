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

ActiveRecord::Schema.define(version: 20131211065014) do

  create_table "assemblies", force: true do |t|
    t.string   "master_item",                limit: 50
    t.date     "build_date"
    t.string   "item_description",           limit: 100
    t.string   "warranty_description"
    t.string   "wo_description"
    t.string   "po_description"
    t.boolean  "is_po"
    t.boolean  "is_wo"
    t.string   "unit_of_measurement"
    t.decimal  "total_material",                         precision: 5, scale: 2
    t.decimal  "tax_rate_percentage",                    precision: 5, scale: 2
    t.decimal  "total_tax",                              precision: 5, scale: 2
    t.decimal  "total_labor",                            precision: 5, scale: 2
    t.decimal  "total_cost",                             precision: 5, scale: 2
    t.decimal  "markup_operator_percentage",             precision: 5, scale: 2
    t.decimal  "markup_total_amt",                       precision: 5, scale: 2
    t.decimal  "total_price",                            precision: 5, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company", force: true do |t|
    t.string   "name",       limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company", ["name"], name: "name_UNIQUE", unique: true, using: :btree

  create_table "customer", force: true do |t|
    t.string   "first_name",      limit: 50,                                       null: false
    t.string   "last_name",       limit: 50,                                       null: false
    t.string   "email",           limit: 100,                                      null: false
    t.integer  "type"
    t.integer  "lead_source_id"
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
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
    t.string   "misc",            limit: 500
    t.integer  "company_id"
    t.integer  "sales_person_id"
    t.string   "company_name",    limit: 100
    t.string   "title",           limit: 45
    t.decimal  "latitude",                    precision: 10, scale: 8
    t.decimal  "longitude",                   precision: 11, scale: 8
    t.integer  "is_active",       limit: 1,                            default: 1
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

  create_table "employees", force: true do |t|
    t.string   "first_name", limit: 50
    t.string   "last_name",  limit: 50
    t.string   "address",    limit: 100
    t.string   "city",       limit: 50
    t.string   "state",      limit: 25
    t.string   "zip",        limit: 10
    t.string   "phone",      limit: 15
    t.boolean  "is_active"
    t.boolean  "is_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estimate_types", force: true do |t|
    t.string   "estimate_type",    limit: 50
    t.string   "default_overhead", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_codes", force: true do |t|
    t.string   "item_code",      limit: 20
    t.string   "item_name",      limit: 100
    t.string   "uom",            limit: 100
    t.decimal  "item_cost",                  precision: 5, scale: 2
    t.decimal  "material_cost",              precision: 5, scale: 2
    t.decimal  "material_w_tax",             precision: 5, scale: 2
    t.decimal  "labor_rate",                 precision: 5, scale: 2
    t.decimal  "retail_price",               precision: 5, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_details", force: true do |t|
    t.date     "job_start_date"
    t.integer  "job_status_id"
    t.string   "how_many_stories"
    t.integer  "existing_roof_type_id"
    t.integer  "new_roof_type_id"
    t.integer  "product_type_id"
    t.integer  "product_color_id"
    t.integer  "sales_rep_id"
    t.integer  "estimate_type_id"
    t.string   "contract_price"
    t.string   "deposit_due"
    t.string   "deposit_method"
    t.date     "date_completed"
    t.string   "job_notes"
    t.string   "lead_sheet_note"
    t.integer  "info_taken_by_id"
    t.integer  "assign_to_id"
    t.date     "date_taken"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_details", ["assign_to_id"], name: "fk_assign_to_idx", using: :btree
  add_index "job_details", ["estimate_type_id"], name: "fk_estimate_type_idx", using: :btree
  add_index "job_details", ["existing_roof_type_id"], name: "fk_exist_roof_type_idx", using: :btree
  add_index "job_details", ["info_taken_by_id"], name: "fk_info_taken_by_idx", using: :btree
  add_index "job_details", ["job_status_id"], name: "fk_status_idx", using: :btree
  add_index "job_details", ["new_roof_type_id"], name: "fk_new_roof_type_idx", using: :btree
  add_index "job_details", ["product_color_id"], name: "fk_product_color_idx", using: :btree
  add_index "job_details", ["product_type_id"], name: "fk_product_type_idx", using: :btree
  add_index "job_details", ["sales_rep_id"], name: "fk_sales_rep_idx", using: :btree

  create_table "job_estimates", force: true do |t|
    t.integer  "job_detail_id"
    t.integer  "step"
    t.integer  "master_item_id"
    t.integer  "qty"
    t.string   "proposal_desc"
    t.string   "warranty_desc"
    t.decimal  "retail_price",   precision: 10, scale: 0
    t.string   "item_extended"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_service_types", force: true do |t|
    t.integer "job_detail_id",   null: false
    t.integer "service_type_id", null: false
  end

  add_index "job_service_types", ["job_detail_id"], name: "fk_job_detail_id_idx", using: :btree
  add_index "job_service_types", ["service_type_id"], name: "fk_serv_type_idx", using: :btree

  create_table "job_site", force: true do |t|
    t.integer  "customer_id",                                                             null: false
    t.string   "company_name",           limit: 100
    t.string   "contact_name",           limit: 100,                                      null: false
    t.string   "phone",                  limit: 15
    t.string   "work_phone",             limit: 15
    t.string   "work_phone_ext",         limit: 10
    t.string   "mobile_phone",           limit: 15
    t.string   "fax",                    limit: 15
    t.string   "pager",                  limit: 15
    t.string   "street1",                limit: 100
    t.string   "street2",                limit: 100
    t.string   "city",                   limit: 15
    t.string   "state",                  limit: 15
    t.string   "zip",                    limit: 10
    t.string   "direction",              limit: 200
    t.string   "easily_accessible",      limit: 45
    t.string   "cust_vacating_when",     limit: 45
    t.string   "parking_consideration",  limit: 45
    t.string   "dumpster_loc_note",      limit: 45
    t.string   "side_garage_use",        limit: 45
    t.string   "driveway_dirt_asphalt",  limit: 45
    t.string   "electrical_location",    limit: 45
    t.string   "water_sanitation_avail", limit: 45
    t.string   "animals_restrain",       limit: 45
    t.string   "gutter_color_noted",     limit: 45
    t.string   "landscape_concerns",     limit: 45
    t.string   "work_number_shift",      limit: 45
    t.string   "additional_notes",       limit: 200
    t.integer  "is_active",              limit: 1,                            default: 1
    t.decimal  "latitude",                           precision: 10, scale: 8
    t.decimal  "longitude",                          precision: 11, scale: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_site", ["customer_id"], name: "fk_job_customer_idx", using: :btree

  create_table "job_statuses", force: true do |t|
    t.string   "job_status", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lead_source", force: true do |t|
    t.string   "source",     limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lead_source", ["source"], name: "source_UNIQUE", unique: true, using: :btree

  create_table "product_colors", force: true do |t|
    t.string   "product_color", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_types", force: true do |t|
    t.string   "product_type", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roof_types", force: true do |t|
    t.string   "roof_type",  limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_types", force: true do |t|
    t.string   "service_type", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

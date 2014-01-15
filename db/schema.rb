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

ActiveRecord::Schema.define(version: 20140112010904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "assemblies", force: true do |t|
    t.string   "master_item",                limit: 50
    t.date     "build_date"
    t.string   "item_description",           limit: 300
    t.string   "warranty_description"
    t.string   "wo_description"
    t.string   "proposal_description"
    t.float    "total_material"
    t.float    "tax_rate_percentage"
    t.float    "total_tax"
    t.float    "total_labor"
    t.float    "total_cost"
    t.float    "markup_operator_percentage"
    t.float    "total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uom_id",                     limit: 2
    t.float    "total_material_cost"
  end

  create_table "assembly_items", force: true do |t|
    t.integer  "item_code_id"
    t.float    "labor_cost"
    t.float    "material_cost"
    t.float    "percentage_used"
    t.float    "material_cost_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assembly_id"
    t.float    "item_price"
    t.date     "build_date"
    t.float    "markup_operator_percentage"
    t.boolean  "is_po"
    t.boolean  "is_wo"
    t.float    "material_tax_percentage"
    t.float    "material_tax_cost"
    t.float    "total_cost"
    t.float    "total_material_cost"
  end

  create_table "assets", force: true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.integer  "job_site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "main_phone"
    t.string   "fax_number"
    t.string   "main_email"
    t.string   "website"
    t.string   "license"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_types", force: true do |t|
    t.string   "contact_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer", force: true do |t|
    t.string   "first_name",      limit: 50,                                            null: false
    t.string   "last_name",       limit: 50,                                            null: false
    t.string   "email",           limit: 100,                                           null: false
    t.integer  "type"
    t.integer  "lead_source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street1",         limit: 100
    t.string   "street2",         limit: 100
    t.string   "city",            limit: 45
    t.string   "state",           limit: 30
    t.string   "zip",             limit: 20
    t.string   "home_phone",      limit: 15
    t.string   "mobile_phone",    limit: 15
    t.string   "work_phone",      limit: 15
    t.string   "work_phone_ext",  limit: 10
    t.string   "fax",             limit: 15
    t.string   "website",         limit: 100
    t.string   "misc",            limit: 500
    t.integer  "company_id"
    t.integer  "sales_person_id"
    t.string   "title",           limit: 45
    t.decimal  "latitude",                    precision: 10, scale: 8
    t.decimal  "longitude",                   precision: 11, scale: 8
    t.integer  "is_active",       limit: 2,                            default: 1
    t.string   "status",          limit: 50,                           default: "Lead"
    t.string   "referral_notes",  limit: 300
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
    t.string   "item_code",     limit: 20
    t.string   "item_name",     limit: 100
    t.float    "material_cost",             default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uom_id",        limit: 2
  end

  create_table "job_call_notes", force: true do |t|
    t.integer  "job_site_id"
    t.string   "call_notes"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "call_time",   limit: 10
    t.date     "call_date"
  end

  create_table "job_change_orders", force: true do |t|
    t.integer  "job_site_id"
    t.string   "co_number"
    t.string   "co_total"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_contacts", force: true do |t|
    t.integer  "job_site_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "contact_type_id"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.string   "contact_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_costings", force: true do |t|
    t.integer  "job_site_id"
    t.string   "materials"
    t.string   "labor"
    t.decimal  "job_cost"
    t.decimal  "overhead"
    t.integer  "overhead_percentage"
    t.decimal  "net_profit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_documents", force: true do |t|
    t.integer  "job_site_id"
    t.string   "doc_name"
    t.string   "doc_desc"
    t.string   "doc_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_estimate_items", force: true do |t|
    t.integer  "job_estimate_id",             null: false
    t.integer  "step"
    t.integer  "master_item_id"
    t.integer  "qty"
    t.string   "proposal_desc",   limit: 330
    t.string   "warranty_desc",   limit: 330
    t.float    "retail_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "item_extended"
  end

  add_index "job_estimate_items", ["master_item_id"], name: "fk_master_item_id_idx", using: :btree

  create_table "job_estimate_statuses", force: true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_estimates", force: true do |t|
    t.string   "name"
    t.float    "total_item_price"
    t.float    "price_adjustment"
    t.string   "reason_desc"
    t.integer  "estimate_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_site_id"
    t.float    "contract_price"
  end

  create_table "job_roof_types", force: true do |t|
    t.integer "job_id",           null: false
    t.integer "new_roof_type_id", null: false
  end

  add_index "job_roof_types", ["id"], name: "fk_roof_type_idx01", using: :btree
  add_index "job_roof_types", ["job_id"], name: "fk_job_site_id_idx01", using: :btree

  create_table "job_service_types", force: true do |t|
    t.integer "job_id",          null: false
    t.integer "service_type_id", null: false
  end

  add_index "job_service_types", ["job_id"], name: "fk_job_site_id_idx", using: :btree
  add_index "job_service_types", ["service_type_id"], name: "fk_serv_type_idx", using: :btree

  create_table "job_site", force: true do |t|
    t.integer  "customer_id",                                                                null: false
    t.string   "contact_name",          limit: 100,                                          null: false
    t.string   "phone",                 limit: 15
    t.string   "work_phone",            limit: 15
    t.string   "work_phone_ext",        limit: 10
    t.string   "mobile_phone",          limit: 15
    t.string   "fax",                   limit: 15
    t.string   "website",               limit: 100
    t.string   "street1",               limit: 100
    t.string   "street2",               limit: 100
    t.string   "city",                  limit: 50
    t.string   "state",                 limit: 50
    t.string   "zip",                   limit: 20
    t.integer  "is_active",             limit: 2,                            default: 1
    t.decimal  "latitude",                          precision: 10, scale: 8
    t.decimal  "longitude",                         precision: 11, scale: 8
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
    t.date     "date_taken"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_closed",                                                  default: false
    t.string   "approx_age",            limit: 100
  end

  add_index "job_site", ["customer_id"], name: "fk_job_customer_idx", using: :btree
  add_index "job_site", ["estimate_type_id"], name: "fk_estimate_type_idx", using: :btree
  add_index "job_site", ["existing_roof_type_id"], name: "fk_exist_roof_type_idx", using: :btree
  add_index "job_site", ["info_taken_by_id"], name: "fk_info_taken_by_idx", using: :btree
  add_index "job_site", ["job_status_id"], name: "fk_status_idx", using: :btree
  add_index "job_site", ["new_roof_type_id"], name: "fk_new_roof_type_idx", using: :btree
  add_index "job_site", ["product_color_id"], name: "fk_product_color_idx", using: :btree
  add_index "job_site", ["product_type_id"], name: "fk_product_type", using: :btree
  add_index "job_site", ["sales_rep_id"], name: "fk_sales_rep_idx", using: :btree

  create_table "job_statuses", force: true do |t|
    t.string   "status",        limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_job_closed",             default: false
  end

  create_table "job_tasks", force: true do |t|
    t.integer  "job_site_id"
    t.integer  "task_type_id"
    t.string   "task_note"
    t.date     "target_date"
    t.integer  "entered_by_id"
    t.date     "date_completed"
    t.integer  "completed_by_id"
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

  create_table "sales_taxes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "sales_tax"
  end

  create_table "service_types", force: true do |t|
    t.string   "service_type", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_types", force: true do |t|
    t.string   "task_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unit_of_measurements", force: true do |t|
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "city1"
    t.string   "state1"
    t.string   "zip1"
    t.string   "address2"
    t.string   "city2"
    t.string   "state2"
    t.string   "zip2"
    t.string   "gm_name"
    t.string   "gm_phone"
    t.integer  "sales_rep_id"
    t.string   "sales_rep_phone"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

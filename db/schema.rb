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

ActiveRecord::Schema.define(version: 20180118214614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "name",                       null: false
    t.string   "direction",                  null: false
    t.string   "phone",                      null: false
    t.string   "identification",             null: false
    t.integer  "deleted",        default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string  "name",                  null: false
    t.string  "nit",                   null: false
    t.string  "direction",             null: false
    t.string  "city",                  null: false
    t.string  "country",               null: false
    t.integer "deleted",   default: 0
  end

  add_index "companies", ["name"], name: "index_companies_on_name", unique: true, using: :btree
  add_index "companies", ["nit"], name: "index_companies_on_nit", unique: true, using: :btree

  create_table "invoice_products", force: :cascade do |t|
    t.integer "invoice_id",          null: false
    t.integer "product_id",          null: false
    t.integer "product_quantity",    null: false
    t.float   "product_total_price", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.date     "date",                   null: false
    t.float    "balance",                null: false
    t.float    "tax",                    null: false
    t.integer  "status",     default: 0, null: false
    t.integer  "client_id",              null: false
    t.integer  "company_id",             null: false
    t.integer  "deleted",    default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                   null: false
    t.float    "price",                  null: false
    t.integer  "deleted",    default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end

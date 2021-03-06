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

ActiveRecord::Schema.define(version: 2020_01_13_003347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "device_property_values", force: :cascade do |t|
    t.string "value", null: false
    t.bigint "device_id"
    t.bigint "device_type_property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id", "device_type_property_id"], name: "device_property_value_indexes", unique: true
    t.index ["device_id"], name: "index_device_property_values_on_device_id"
    t.index ["device_type_property_id"], name: "index_device_property_values_on_device_type_property_id"
  end

  create_table "device_type_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "device_type_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "device_type_desc_idx"
  end

  create_table "device_type_properties", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "device_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_type_id"], name: "index_device_type_properties_on_device_type_id"
  end

  create_table "device_types", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_device_types_on_parent_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "device_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_type_id"], name: "index_devices_on_device_type_id"
  end

  add_foreign_key "device_property_values", "device_type_properties"
  add_foreign_key "device_property_values", "devices"
  add_foreign_key "device_type_properties", "device_types"
  add_foreign_key "device_types", "device_types", column: "parent_id"
  add_foreign_key "devices", "device_types"
end

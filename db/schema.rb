# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_10_15_202722) do
  create_table "discount_rule_discounted_items", force: :cascade do |t|
    t.integer "discount_rule_id", null: false
    t.integer "item_id", null: false
    t.decimal "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_rule_id"], name: "index_discount_rule_discounted_items_on_discount_rule_id"
    t.index ["item_id"], name: "index_discount_rule_discounted_items_on_item_id"
  end

  create_table "discount_rule_trigger_items", force: :cascade do |t|
    t.integer "discount_rule_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_rule_id"], name: "index_discount_rule_trigger_items_on_discount_rule_id"
    t.index ["item_id"], name: "index_discount_rule_trigger_items_on_item_id"
  end

  create_table "discount_rules", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_tax_categories", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "tax_rate"
    t.index ["item_id"], name: "index_item_tax_categories_on_item_id"
    t.index ["location_id"], name: "index_item_tax_categories_on_location_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.decimal "price", precision: 5, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_items_on_name", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "item_id", null: false
    t.decimal "price", precision: 5, scale: 2
    t.decimal "tax_rate", precision: 5, scale: 2
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "discounted_price", default: "0.0"
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.decimal "total_price", precision: 5, scale: 2
    t.boolean "is_completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "total_discounted_price", default: "0.0"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Location"
    t.integer "location_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["location_id"], name: "index_users_on_location_id"
  end

  add_foreign_key "discount_rule_discounted_items", "discount_rules"
  add_foreign_key "discount_rule_discounted_items", "items"
  add_foreign_key "discount_rule_trigger_items", "discount_rules"
  add_foreign_key "discount_rule_trigger_items", "items"
  add_foreign_key "item_tax_categories", "items"
  add_foreign_key "item_tax_categories", "locations"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "users", "locations"
end

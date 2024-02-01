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

ActiveRecord::Schema[7.0].define(version: 2024_01_04_212445) do
  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_categories_on_store_id"
  end

  create_table "closes", force: :cascade do |t|
    t.date "date"
    t.decimal "cash_total", default: "0.0"
    t.decimal "card_total", default: "0.0"
    t.decimal "transfer_total", default: "0.0"
    t.decimal "cash_expenses", default: "0.0"
    t.decimal "reported_difference", default: "0.0"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "real_total"
  end

  create_table "expenses", force: :cascade do |t|
    t.date "date", null: false
    t.decimal "amount", default: "0.0", null: false
    t.integer "source", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "external_incomes", force: :cascade do |t|
    t.date "date", null: false
    t.decimal "amount", default: "0.0", null: false
    t.integer "payment_method", null: false
    t.integer "source", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.decimal "stock"
    t.string "measurement_unit"
    t.decimal "stock_warning"
    t.integer "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "provider_id"
    t.index ["provider_id"], name: "index_items_on_provider_id"
    t.index ["store_id"], name: "index_items_on_store_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity", default: 1
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "order_type"
    t.integer "status", default: 0
    t.integer "delivery_app"
    t.integer "table"
    t.integer "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "discount"
    t.integer "discount_type"
    t.index ["store_id"], name: "index_orders_on_store_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "order_id", null: false
    t.decimal "total", default: "0.0"
    t.decimal "discount", default: "0.0"
    t.integer "discount_type"
    t.integer "payment_method", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "ability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_items", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "item_id", null: false
    t.decimal "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_product_items_on_item_id"
    t.index ["product_id"], name: "index_product_items_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "category_id", null: false
    t.integer "store_id", null: false
    t.boolean "available", default: false
    t.string "product_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "working_station_id", null: false
    t.decimal "price"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["store_id"], name: "index_products_on_store_id"
    t.index ["working_station_id"], name: "index_products_on_working_station_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.integer "store_id", null: false
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_providers_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_abilities", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "ability_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ability_id"], name: "index_user_abilities_on_ability_id"
    t.index ["user_id"], name: "index_user_abilities_on_user_id"
  end

  create_table "user_permissions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "permission_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_user_permissions_on_permission_id"
    t.index ["user_id"], name: "index_user_permissions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.integer "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["store_id"], name: "index_users_on_store_id"
  end

  create_table "working_stations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "store_id", null: false
    t.index ["store_id"], name: "index_working_stations_on_store_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "categories", "stores"
  add_foreign_key "items", "providers"
  add_foreign_key "items", "stores"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "stores"
  add_foreign_key "payments", "orders"
  add_foreign_key "product_items", "items"
  add_foreign_key "product_items", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "stores"
  add_foreign_key "products", "working_stations"
  add_foreign_key "providers", "stores"
  add_foreign_key "user_abilities", "abilities"
  add_foreign_key "user_abilities", "users"
  add_foreign_key "user_permissions", "permissions"
  add_foreign_key "user_permissions", "users"
  add_foreign_key "users", "stores"
  add_foreign_key "working_stations", "stores"
end

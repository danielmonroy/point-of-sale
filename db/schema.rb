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

ActiveRecord::Schema[7.0].define(version: 2023_05_11_045222) do
  create_table "cart_product_extras", force: :cascade do |t|
    t.integer "cart_product_id", null: false
    t.integer "item_id", null: false
    t.decimal "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_product_id"], name: "index_cart_product_extras_on_cart_product_id"
    t.index ["item_id"], name: "index_cart_product_extras_on_item_id"
  end

  create_table "cart_products", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "product_id", null: false
    t.decimal "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_products_on_cart_id"
    t.index ["product_id"], name: "index_cart_products_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_categories_on_store_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.decimal "stock"
    t.string "measurement_unit"
    t.decimal "stock_warning"
    t.integer "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_items_on_store_id"
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
    t.boolean "available"
    t.string "product_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "working_station_id", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["store_id"], name: "index_products_on_store_id"
    t.index ["working_station_id"], name: "index_products_on_working_station_id"
  end

  create_table "sale_product_extras", force: :cascade do |t|
    t.integer "sale_product_id", null: false
    t.integer "item_id", null: false
    t.decimal "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_sale_product_extras_on_item_id"
    t.index ["sale_product_id"], name: "index_sale_product_extras_on_sale_product_id"
  end

  create_table "sale_products", force: :cascade do |t|
    t.integer "sale_id", null: false
    t.integer "product_id", null: false
    t.decimal "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sale_products_on_product_id"
    t.index ["sale_id"], name: "index_sale_products_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "user_id", null: false
    t.decimal "sale_total"
    t.decimal "discount"
    t.integer "payment_method"
    t.string "ticket_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "cart_product_extras", "cart_products"
  add_foreign_key "cart_product_extras", "items"
  add_foreign_key "cart_products", "carts"
  add_foreign_key "cart_products", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "categories", "stores"
  add_foreign_key "items", "stores"
  add_foreign_key "product_items", "items"
  add_foreign_key "product_items", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "stores"
  add_foreign_key "products", "working_stations"
  add_foreign_key "sale_product_extras", "items"
  add_foreign_key "sale_product_extras", "sale_products"
  add_foreign_key "sale_products", "products"
  add_foreign_key "sale_products", "sales"
  add_foreign_key "sales", "users"
  add_foreign_key "user_permissions", "permissions"
  add_foreign_key "user_permissions", "users"
  add_foreign_key "users", "stores"
  add_foreign_key "working_stations", "stores"
end

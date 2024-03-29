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

ActiveRecord::Schema.define(version: 20170625044320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_comments_on_product_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.integer  "sku"
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "category_id"
    t.string   "image"
    t.boolean  "jumbotron"
    t.string   "jumbotron_image"
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["sku"], name: "index_products_on_sku", unique: true, using: :btree
  end

  create_table "shopping_cart_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "shopping_cart_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["product_id"], name: "index_shopping_cart_products_on_product_id", using: :btree
    t.index ["shopping_cart_id"], name: "index_shopping_cart_products_on_shopping_cart_id", using: :btree
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "reserved"
    t.index ["user_id"], name: "index_shopping_carts_on_user_id", using: :btree
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "shopping_cart_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "dispatched"
    t.index ["shopping_cart_id"], name: "index_transactions_on_shopping_cart_id", using: :btree
    t.index ["user_id"], name: "index_transactions_on_user_id", using: :btree
  end

  create_table "user_keys", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_keys_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "wish_list_products", force: :cascade do |t|
    t.integer  "wish_list_id"
    t.integer  "product_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["product_id"], name: "index_wish_list_products_on_product_id", using: :btree
    t.index ["wish_list_id"], name: "index_wish_list_products_on_wish_list_id", using: :btree
  end

  create_table "wish_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wish_lists_on_user_id", using: :btree
  end

  add_foreign_key "comments", "products"
  add_foreign_key "comments", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "shopping_cart_products", "products"
  add_foreign_key "shopping_cart_products", "shopping_carts"
  add_foreign_key "shopping_carts", "users"
  add_foreign_key "transactions", "shopping_carts"
  add_foreign_key "transactions", "users"
  add_foreign_key "user_keys", "users"
  add_foreign_key "wish_list_products", "products"
  add_foreign_key "wish_list_products", "wish_lists"
  add_foreign_key "wish_lists", "users"
end

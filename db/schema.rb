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

ActiveRecord::Schema.define(version: 2020_07_20_053420) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.integer "member_id"
    t.integer "number"
  end

  create_table "cart_ites", force: :cascade do |t|
    t.integer "product_id"
    t.integer "member_id"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.boolean "is_enabled", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
=======
# Could not dump table "members" because of following StandardError
#   Unknown type '' for column 'first_name'

  create_table "oders", force: :cascade do |t|
    t.integer "member_id"
>>>>>>> 50ce59b2cadfcb2149ff640e1f0d0e6b2d68eb34
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "first_name_phonetic"
    t.string "last_name_phonetic"
    t.string "telephone_number"
    t.string "postcode"
    t.string "address"
<<<<<<< HEAD
    t.boolean "is_deleted", default: true
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
=======
    t.integer "postage"
    t.integer "total_products_cos"
    t.integer "payment_method"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
>>>>>>> 50ce59b2cadfcb2149ff640e1f0d0e6b2d68eb34
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "work_status", default: 0
    t.integer "number"
    t.integer "tax_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "member_id"
    t.string "name"
    t.string "postcode"
    t.string "address"
    t.integer "postage", default: 800
    t.integer "total_products_cost"
    t.integer "payment_method", default: 0
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "genre_id"
    t.string "name"
    t.text "explanatory"
    t.string "image_id"
    t.boolean "is_capable", default: true
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shippings", force: :cascade do |t|
    t.integer "member_id"
    t.string "name"
    t.string "postcode"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

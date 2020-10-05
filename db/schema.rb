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

ActiveRecord::Schema.define(version: 2020_10_04_143558) do

  create_table "accepts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "order_work_id"
    t.integer "proposal_id"
    t.integer "payment_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_work_id"], name: "index_accepts_on_order_work_id"
    t.index ["proposal_id"], name: "index_accepts_on_proposal_id"
    t.index ["user_id"], name: "index_accepts_on_user_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "reply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "listing_genres", force: :cascade do |t|
    t.string "name"
    t.boolean "is_valid", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listing_works", force: :cascade do |t|
    t.integer "listing_genre_id"
    t.string "name"
    t.text "description"
    t.boolean "is_sales"
    t.integer "count"
    t.integer "price"
    t.string "image"
    t.string "video"
    t.string "audio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "room_id"
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "order_genres", force: :cascade do |t|
    t.string "name"
    t.boolean "is_valid", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_works", force: :cascade do |t|
    t.integer "order_genre_id"
    t.string "name"
    t.text "description"
    t.boolean "is_sales", default: true, null: false
    t.integer "price"
    t.string "image"
    t.string "video"
    t.string "audio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "term"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "payment_method"
    t.integer "status"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "proposal_id"
    t.integer "listing_work_id"
    t.index ["listing_work_id"], name: "index_orders_on_listing_work_id"
    t.index ["proposal_id"], name: "index_orders_on_proposal_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.integer "user_id"
    t.string "statement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "term"
    t.integer "price"
    t.integer "order_work_id"
    t.integer "accept_id"
    t.index ["accept_id"], name: "index_proposals_on_accept_id"
    t.index ["order_work_id"], name: "index_proposals_on_order_work_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.float "rate", default: 0.0, null: false
    t.integer "user_id"
    t.integer "listing_work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_work_id"], name: "index_reviews_on_listing_work_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "profile_image"
    t.boolean "is_unsubscribe", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_09_102706) do

  create_table "accounts", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "approved"
    t.integer "approved_by"
    t.boolean "personal_account"
    t.boolean "business_account"
    t.string "balance"
    t.string "date_approved"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "blocks", force: :cascade do |t|
    t.string "current_hash"
    t.string "previous_hash"
    t.string "timestamp"
    t.string "from"
    t.string "to"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cost"
    t.string "tax"
  end

  create_table "friends", force: :cascade do |t|
    t.integer "friend_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pendingtransactions", force: :cascade do |t|
    t.integer "from_user_id"
    t.integer "to_user_id"
    t.string "amount"
    t.boolean "aproved"
    t.boolean "declined"
    t.string "expdate"
    t.string "timestamp"
    t.boolean "seen"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "date_of_with"
    t.string "pirth_place"
    t.string "primary_phone_number"
    t.string "secondary_phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "balance"
    t.boolean "approved"
    t.integer "approved_by"
    t.boolean "personal_account"
    t.boolean "business_account"
    t.string "date_approved"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end

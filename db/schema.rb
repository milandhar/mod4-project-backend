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

ActiveRecord::Schema.define(version: 2019_07_12_174243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "small_photo_url"
    t.string "medium_photo_url"
    t.string "gender"
    t.text "description"
    t.string "breed_primary"
    t.string "species"
    t.string "age"
    t.string "status"
    t.string "email_address"
    t.string "profile_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_pets", force: :cascade do |t|
    t.bigint "pet_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_user_pets_on_pet_id"
    t.index ["user_id"], name: "index_user_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "img_path"
    t.integer "zipcode"
    t.string "email_address"
    t.text "message_template", default: "I found this pup's profile on BarkBrowser and I am interested in potentially meeting and adopting them. Please let me know your availability so we can set up a meeting! Looking forward to connecting."
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2019_06_29_002629) do
=======
ActiveRecord::Schema.define(version: 2019_06_25_164151) do
>>>>>>> 8b1310004059b47c9a70c16d28f5a13364c232f9

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "classification"
    t.string "species"
    t.string "breed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
<<<<<<< HEAD
    t.text "content"
=======
    t.string "description"
>>>>>>> 8b1310004059b47c9a70c16d28f5a13364c232f9
    t.integer "user_id"
    t.integer "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_posts_on_pet_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
    t.string "email"
    t.string "password_digest"
=======
>>>>>>> 8b1310004059b47c9a70c16d28f5a13364c232f9
  end

end

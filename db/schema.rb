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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", id: :serial, force: :cascade do |t|
    t.text "title"
    t.integer "rating"
    t.boolean "book_completed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "author"
  end

  create_table "recipes", id: :serial, force: :cascade do |t|
    t.text "name"
    t.integer "ingredient_count"
    t.text "ingredient_list"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.serial "book_id", null: false
  end

  add_foreign_key "recipes", "books", name: "recipes_book_id_fkey"
end

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

ActiveRecord::Schema[8.0].define(version: 2025_10_04_140429) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "message_templates", force: :cascade do |t|
    t.integer "category"
    t.integer "emoji"
    t.integer "tone"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meta_tags_lists", force: :cascade do |t|
    t.string "name"
    t.string "identifier"
    t.string "meta_taggable_type"
    t.bigint "meta_taggable_id"
    t.string "meta_title"
    t.text "meta_description"
    t.text "meta_keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meta_taggable_type", "meta_taggable_id"], name: "index_meta_tags_lists_on_meta_taggable"
  end

  create_table "translations", force: :cascade do |t|
    t.integer "emoji"
    t.integer "tone"
    t.integer "strength"
    t.integer "radio_emoji"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end

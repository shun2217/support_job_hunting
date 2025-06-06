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

ActiveRecord::Schema[7.0].define(version: 2025_05_03_152516) do
  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.integer "industry_id"
    t.text "information"
    t.text "strength"
    t.text "weakness"
    t.integer "status", default: 0, null: false
    t.integer "desire", default: 0, null: false
    t.string "my_page"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entry_sheets", force: :cascade do |t|
    t.string "title"
    t.text "question"
    t.text "answer"
    t.integer "event_id"
    t.integer "words"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer "company_id"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industries", force: :cascade do |t|
    t.string "name", null: false
    t.integer "interest", default: 0, null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

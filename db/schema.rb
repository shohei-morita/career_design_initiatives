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

ActiveRecord::Schema.define(version: 2021_01_17_081222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "postcode", null: false
    t.integer "prefecture_code", null: false
    t.string "address_city", null: false
    t.string "address_street", null: false
    t.string "address_building"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_addresses_on_student_id"
  end

  create_table "awards", force: :cascade do |t|
    t.string "title", null: false
    t.date "year", null: false
    t.text "summary"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_awards_on_student_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.date "foundation_year", null: false
    t.string "capital", null: false
    t.string "president_name", null: false
    t.text "url", null: false
    t.text "number_of_employees", null: false
    t.text "business_outline"
    t.bigint "recruiter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "revenue"
    t.index ["recruiter_id"], name: "index_companies_on_recruiter_id"
  end

  create_table "educational_backgrounds", force: :cascade do |t|
    t.integer "location", null: false
    t.integer "division", null: false
    t.string "school_name", null: false
    t.date "entrance_date", null: false
    t.date "graduation_date", null: false
    t.text "note"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_educational_backgrounds_on_student_id"
  end

  create_table "extracurricular_activities", force: :cascade do |t|
    t.string "name", null: false
    t.date "beginning_year", null: false
    t.date "ending_year"
    t.text "summary"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_extracurricular_activities_on_student_id"
  end

  create_table "job_infromations", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.text "appealing_point", null: false
    t.text "pay", null: false
    t.text "working_status", null: false
    t.text "working_hour", null: false
    t.text "benefit", null: false
    t.text "day_off", null: false
    t.text "selection", null: false
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_job_infromations_on_company_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "department", null: false
    t.string "title"
    t.string "tel", null: false
    t.string "fax"
    t.boolean "admin", default: false, null: false
    t.boolean "approved", default: false, null: false
    t.boolean "suspended", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_recruiters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_recruiters_on_reset_password_token", unique: true
  end

  create_table "self_introductions", force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.text "content"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_self_introductions_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "family_name"
    t.string "given_name"
    t.string "family_name_kana"
    t.string "given_name_kana"
    t.string "nickname"
    t.string "tel"
    t.boolean "suspended", default: false, null: false
    t.integer "gender"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "graduation_year", null: false
    t.date "birth_date"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "students"
  add_foreign_key "awards", "students"
  add_foreign_key "companies", "recruiters"
  add_foreign_key "educational_backgrounds", "students"
  add_foreign_key "extracurricular_activities", "students"
  add_foreign_key "job_infromations", "companies"
  add_foreign_key "self_introductions", "students"
end

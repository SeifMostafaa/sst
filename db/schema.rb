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

ActiveRecord::Schema.define(version: 2021_07_05_182705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_years", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "semester"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "year"
    t.integer "status"
    t.index ["deleted_at"], name: "index_academic_years_on_deleted_at"
  end

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "announcements", force: :cascade do |t|
    t.integer "announcement_type"
    t.integer "user_type"
    t.string "title_en"
    t.string "title_ar"
    t.string "description_en"
    t.string "description_ar"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_announcements_on_deleted_at"
  end

  create_table "applicants", force: :cascade do |t|
    t.string "full_name"
    t.decimal "grade"
    t.date "date_of_birth"
    t.bigint "national_id"
    t.string "address"
    t.string "parent_full_name"
    t.string "parent_occupation"
    t.string "parent_phone"
    t.string "emergency_phone"
    t.text "notes"
    t.bigint "major_first_choice_id", null: false
    t.bigint "major_second_choice_id", null: false
    t.datetime "deleted_at"
    t.integer "gender"
    t.string "preparatory_school"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_applicants_on_deleted_at"
    t.index ["major_first_choice_id"], name: "index_applicants_on_major_first_choice_id"
    t.index ["major_second_choice_id"], name: "index_applicants_on_major_second_choice_id"
  end

  create_table "majors", force: :cascade do |t|
    t.string "name_en"
    t.string "name_ar"
    t.string "description_en"
    t.string "description_ar"
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_majors_on_deleted_at"
  end

  create_table "subject_class_materials", force: :cascade do |t|
    t.bigint "subject_class_id", null: false
    t.string "name_en"
    t.string "name_ar"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_subject_class_materials_on_deleted_at"
    t.index ["subject_class_id"], name: "index_subject_class_materials_on_subject_class_id"
  end

  create_table "subject_class_students", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "subject_class_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_subject_class_students_on_deleted_at"
    t.index ["subject_class_id"], name: "index_subject_class_students_on_subject_class_id"
    t.index ["user_id"], name: "index_subject_class_students_on_user_id"
  end

  create_table "subject_class_teachers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "subject_class_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_subject_class_teachers_on_deleted_at"
    t.index ["subject_class_id"], name: "index_subject_class_teachers_on_subject_class_id"
    t.index ["user_id"], name: "index_subject_class_teachers_on_user_id"
  end

  create_table "subject_classes", force: :cascade do |t|
    t.bigint "academic_year_id", null: false
    t.bigint "subject_id", null: false
    t.integer "number"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["academic_year_id"], name: "index_subject_classes_on_academic_year_id"
    t.index ["deleted_at"], name: "index_subject_classes_on_deleted_at"
    t.index ["subject_id"], name: "index_subject_classes_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name_en"
    t.string "name_ar"
    t.bigint "major_id"
    t.string "description_ar"
    t.string "description_en"
    t.integer "status"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "semester"
    t.index ["deleted_at"], name: "index_subjects_on_deleted_at"
    t.index ["major_id"], name: "index_subjects_on_major_id"
  end

  create_table "time_tables", force: :cascade do |t|
    t.integer "day"
    t.integer "period"
    t.bigint "subject_class_id", null: false
    t.time "start_time"
    t.time "end_time"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_time_tables_on_deleted_at"
    t.index ["subject_class_id"], name: "index_time_tables_on_subject_class_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role"
    t.integer "locale"
    t.string "phone"
    t.date "date_of_birth"
    t.integer "status"
    t.integer "gender"
    t.string "username"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "deleted_at"
    t.string "national_id"
    t.integer "religion"
    t.integer "city"
    t.string "full_name_en"
    t.string "full_name_ar"
    t.string "address_en"
    t.string "address_ar"
    t.text "fcm_token"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "applicants", "majors", column: "major_first_choice_id"
  add_foreign_key "applicants", "majors", column: "major_second_choice_id"
  add_foreign_key "subject_class_materials", "subject_classes"
  add_foreign_key "subject_class_students", "subject_classes"
  add_foreign_key "subject_class_students", "users"
  add_foreign_key "subject_class_teachers", "subject_classes"
  add_foreign_key "subject_class_teachers", "users"
  add_foreign_key "subject_classes", "academic_years"
  add_foreign_key "subject_classes", "subjects"
  add_foreign_key "time_tables", "subject_classes"
end

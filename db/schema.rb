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

ActiveRecord::Schema.define(version: 2021_06_07_111354) do

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
    t.index ["deleted_at"], name: "index_academic_years_on_deleted_at"
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
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "subject_class_students", "subject_classes"
  add_foreign_key "subject_class_students", "users"
  add_foreign_key "subject_class_teachers", "subject_classes"
  add_foreign_key "subject_class_teachers", "users"
  add_foreign_key "subject_classes", "academic_years"
  add_foreign_key "subject_classes", "subjects"
end

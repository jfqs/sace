# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160601064316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "education_degrees", force: :cascade do |t|
    t.integer  "education_level_id"
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "education_degrees", ["education_level_id"], name: "index_education_degrees_on_education_level_id", using: :btree

  create_table "education_levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "secretary_id"
    t.integer  "state"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "grade_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "guardian_id"
    t.integer  "payment_type_id"
    t.integer  "amount"
    t.date     "op_date"
    t.string   "op_code"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "payments", ["payment_type_id"], name: "index_payments_on_payment_type_id", using: :btree

  create_table "periods", force: :cascade do |t|
    t.integer  "year"
    t.integer  "bimester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programmed_sections", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "course_id"
    t.integer  "section_id"
    t.string   "desc"
    t.integer  "day"
    t.integer  "start_time"
    t.integer  "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "programmed_sections", ["course_id"], name: "index_programmed_sections_on_course_id", using: :btree
  add_index "programmed_sections", ["section_id"], name: "index_programmed_sections_on_section_id", using: :btree
  add_index "programmed_sections", ["teacher_id"], name: "index_programmed_sections_on_teacher_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.integer  "education_degree_id"
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "sections", ["education_degree_id"], name: "index_sections_on_education_degree_id", using: :btree

  create_table "student_grades", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "period_id"
    t.integer  "programmed_section_id"
    t.integer  "grade_type_id"
    t.integer  "score"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "student_grades", ["grade_type_id"], name: "index_student_grades_on_grade_type_id", using: :btree
  add_index "student_grades", ["period_id"], name: "index_student_grades_on_period_id", using: :btree
  add_index "student_grades", ["programmed_section_id"], name: "index_student_grades_on_programmed_section_id", using: :btree
  add_index "student_grades", ["student_id"], name: "index_student_grades_on_student_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "dni"
    t.string   "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "education_degrees", "education_levels"
  add_foreign_key "enrollments", "users", column: "secretary_id"
  add_foreign_key "enrollments", "users", column: "student_id"
  add_foreign_key "payments", "payment_types"
  add_foreign_key "payments", "users", column: "guardian_id"
  add_foreign_key "programmed_sections", "courses"
  add_foreign_key "programmed_sections", "sections"
  add_foreign_key "programmed_sections", "users", column: "teacher_id"
  add_foreign_key "sections", "education_degrees"
  add_foreign_key "student_grades", "grade_types"
  add_foreign_key "student_grades", "periods"
  add_foreign_key "student_grades", "programmed_sections"
  add_foreign_key "student_grades", "users", column: "student_id"
end

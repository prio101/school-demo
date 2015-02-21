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

ActiveRecord::Schema.define(version: 20150108095310) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "api_keys", force: true do |t|
    t.integer  "client_id"
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_keys", ["client_id"], name: "index_api_keys_on_client_id", using: :btree

  create_table "attendances", force: true do |t|
    t.integer  "school_id"
    t.integer  "student_id"
    t.boolean  "active"
    t.string   "notes"
    t.integer  "course_id"
    t.integer  "course_section_id"
    t.integer  "batch_id"
    t.boolean  "attended"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "present"
    t.date     "date"
    t.string   "weekday"
  end

  add_index "attendances", ["batch_id"], name: "index_attendances_on_batch_id", using: :btree
  add_index "attendances", ["course_id"], name: "index_attendances_on_course_id", using: :btree
  add_index "attendances", ["course_section_id"], name: "index_attendances_on_course_section_id", using: :btree
  add_index "attendances", ["school_id"], name: "index_attendances_on_school_id", using: :btree

  create_table "batches", force: true do |t|
    t.string   "name"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "defaulter_setting_id"
    t.integer  "defaulter_amount",     default: 2000
  end

  add_index "batches", ["school_id"], name: "index_batches_on_school_id", using: :btree

  create_table "cards", force: true do |t|
    t.string   "tag"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classifications", force: true do |t|
    t.string   "name"
    t.integer  "school_id"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "classifications", ["batch_id"], name: "index_classifications_on_batch_id", using: :btree
  add_index "classifications", ["school_id"], name: "index_classifications_on_school_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "client_key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "client_name"
  end

  add_index "clients", ["client_key"], name: "index_clients_on_client_key", using: :btree

  create_table "collection_schedules", force: true do |t|
    t.string   "fee_category_id"
    t.string   "name"
    t.string   "starting_time",      default: "2014-12-26", null: false
    t.string   "ending_time"
    t.integer  "school_id"
    t.boolean  "create_due_invoice", default: true
    t.date     "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",             default: true
    t.integer  "payment_period",     default: 0
  end

  add_index "collection_schedules", ["fee_category_id"], name: "index_collection_schedules_on_fee_category_id", using: :btree
  add_index "collection_schedules", ["school_id"], name: "index_collection_schedules_on_school_id", using: :btree

  create_table "course_exams", force: true do |t|
    t.integer  "course_id"
    t.integer  "examiner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_exams", ["course_id"], name: "index_course_exams_on_course_id", using: :btree
  add_index "course_exams", ["examiner_id"], name: "index_course_exams_on_examiner_id", using: :btree

  create_table "course_sections", force: true do |t|
    t.integer  "school_id"
    t.string   "section_name"
    t.integer  "course_id"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fee_category_id"
    t.string   "code"
  end

  add_index "course_sections", ["batch_id"], name: "index_course_sections_on_batch_id", using: :btree
  add_index "course_sections", ["code"], name: "index_course_sections_on_code", using: :btree
  add_index "course_sections", ["course_id"], name: "index_course_sections_on_course_id", using: :btree
  add_index "course_sections", ["fee_category_id"], name: "index_course_sections_on_fee_category_id", using: :btree
  add_index "course_sections", ["school_id"], name: "index_course_sections_on_school_id", using: :btree

  create_table "course_subjects", force: true do |t|
    t.integer  "course_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_subjects", ["course_id"], name: "index_course_subjects_on_course_id", using: :btree
  add_index "course_subjects", ["subject_id"], name: "index_course_subjects_on_subject_id", using: :btree

  create_table "course_teachers", force: true do |t|
    t.integer  "course_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_teachers", ["course_id"], name: "index_course_teachers_on_course_id", using: :btree
  add_index "course_teachers", ["teacher_id"], name: "index_course_teachers_on_teacher_id", using: :btree

  create_table "course_timetables", force: true do |t|
    t.integer  "course_id"
    t.integer  "subject_id"
    t.integer  "school_id"
    t.integer  "day"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_timetables", ["course_id"], name: "index_course_timetables_on_course_id", using: :btree
  add_index "course_timetables", ["school_id"], name: "index_course_timetables_on_school_id", using: :btree
  add_index "course_timetables", ["subject_id"], name: "index_course_timetables_on_subject_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.integer  "school_id"
    t.string   "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.integer  "defaulter_amount", default: 1000
  end

  add_index "courses", ["batch_id"], name: "index_courses_on_batch_id", using: :btree
  add_index "courses", ["code"], name: "index_courses_on_code", using: :btree
  add_index "courses", ["school_id"], name: "index_courses_on_school_id", using: :btree

  create_table "custom_auto_increments", force: true do |t|
    t.string   "model_name"
    t.integer  "counter",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "custom_auto_increments", ["model_name"], name: "index_custom_auto_increments_on_model_name", using: :btree

  create_table "defaulter_settings", force: true do |t|
    t.string   "name"
    t.string   "amount"
    t.integer  "batch_id"
    t.boolean  "current"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "departments", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exam_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exam_schedules", force: true do |t|
    t.integer  "course_id"
    t.datetime "starting_date"
    t.datetime "ending_date"
    t.text     "comment"
    t.integer  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exam_id"
  end

  add_index "exam_schedules", ["active"], name: "index_exam_schedules_on_active", using: :btree
  add_index "exam_schedules", ["course_id"], name: "index_exam_schedules_on_course_id", using: :btree
  add_index "exam_schedules", ["exam_id"], name: "index_exam_schedules_on_exam_id", using: :btree

  create_table "examiners", force: true do |t|
    t.integer  "exam_schedule_id"
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exams", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "exam_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "full_marks",    default: 40, null: false
  end

  add_index "exams", ["exam_group_id"], name: "index_exams_on_exam_group_id", using: :btree
  add_index "exams", ["position"], name: "index_exams_on_position", using: :btree

  create_table "fee_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "recurrent",  default: false
    t.integer  "school_id"
    t.string   "fee"
  end

  add_index "fee_categories", ["fee"], name: "index_fee_categories_on_fee", using: :btree
  add_index "fee_categories", ["school_id"], name: "index_fee_categories_on_school_id", using: :btree

  create_table "fee_collection_schedules", force: true do |t|
    t.string   "name"
    t.string   "school_id"
    t.text     "schedule"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  add_index "fee_collection_schedules", ["course_id"], name: "index_fee_collection_schedules_on_course_id", using: :btree
  add_index "fee_collection_schedules", ["school_id"], name: "index_fee_collection_schedules_on_school_id", using: :btree

  create_table "fee_collections", force: true do |t|
    t.boolean  "due",             default: true
    t.integer  "fee_category_id"
    t.integer  "school_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fee_collections", ["fee_category_id"], name: "index_fee_collections_on_fee_category_id", using: :btree
  add_index "fee_collections", ["school_id"], name: "index_fee_collections_on_school_id", using: :btree
  add_index "fee_collections", ["student_id"], name: "index_fee_collections_on_student_id", using: :btree

  create_table "fees", force: true do |t|
    t.decimal  "amount",            precision: 10, scale: 0
    t.string   "currency"
    t.integer  "school_id"
    t.integer  "batch_id"
    t.string   "classification_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  add_index "fees", ["batch_id"], name: "index_fees_on_batch_id", using: :btree
  add_index "fees", ["classification_id"], name: "index_fees_on_classification_id", using: :btree
  add_index "fees", ["course_id"], name: "index_fees_on_course_id", using: :btree
  add_index "fees", ["school_id"], name: "index_fees_on_school_id", using: :btree

  create_table "government_salaries", force: true do |t|
    t.integer  "teacher_id"
    t.integer  "bank_no"
    t.integer  "pay_scale_code"
    t.integer  "pay_scale_accomodation_medical"
    t.integer  "incrementt"
    t.integer  "total"
    t.integer  "welfare_reduction"
    t.integer  "retirement_reduction"
    t.integer  "total_reduction"
    t.integer  "total_received"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.integer  "fee_id"
    t.integer  "school_id"
    t.string   "title"
    t.integer  "state"
    t.integer  "user_id"
    t.date     "voided_at"
    t.datetime "paid_at"
    t.date     "due_at"
    t.string   "course_id"
    t.integer  "batch_id"
    t.string   "amount"
    t.string   "invoice_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["batch_id"], name: "index_invoices_on_batch_id", using: :btree
  add_index "invoices", ["course_id"], name: "index_invoices_on_course_id", using: :btree
  add_index "invoices", ["fee_id"], name: "index_invoices_on_fee_id", using: :btree
  add_index "invoices", ["school_id"], name: "index_invoices_on_school_id", using: :btree
  add_index "invoices", ["user_id"], name: "index_invoices_on_user_id", using: :btree

  create_table "marks_submissions", force: true do |t|
    t.decimal  "obtained_marks",    precision: 10, scale: 0
    t.string   "exam_marks"
    t.string   "grace"
    t.integer  "course_exam_id"
    t.integer  "student_id"
    t.integer  "course_section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "marks_submissions", ["course_exam_id"], name: "index_marks_submissions_on_course_exam_id", using: :btree
  add_index "marks_submissions", ["course_section_id"], name: "index_marks_submissions_on_course_section_id", using: :btree
  add_index "marks_submissions", ["student_id"], name: "index_marks_submissions_on_student_id", using: :btree

  create_table "notices", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parents", force: true do |t|
    t.string   "full_name"
    t.boolean  "primary_contract_person"
    t.string   "phone_number"
    t.string   "email"
    t.string   "address"
    t.integer  "school_id"
    t.integer  "student_id"
    t.integer  "batch_id"
    t.integer  "classification_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  add_index "parents", ["batch_id"], name: "index_parents_on_batch_id", using: :btree
  add_index "parents", ["classification_id"], name: "index_parents_on_classification_id", using: :btree
  add_index "parents", ["course_id"], name: "index_parents_on_course_id", using: :btree
  add_index "parents", ["school_id"], name: "index_parents_on_school_id", using: :btree
  add_index "parents", ["student_id"], name: "index_parents_on_student_id", using: :btree

  create_table "results", force: true do |t|
    t.string   "exam_name"
    t.string   "code"
    t.float    "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
  end

  create_table "roles", force: true do |t|
    t.string   "school_id"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["school_id"], name: "index_roles_on_school_id", using: :btree
  add_index "roles", ["user_id"], name: "index_roles_on_user_id", using: :btree

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "details"
    t.string   "banner"
    t.string   "logo"
    t.boolean  "active"
    t.string   "code"
    t.string   "domain"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible",     default: true
    t.string   "sms_api_url"
  end

  create_table "sms_accounts", force: true do |t|
    t.integer  "school_id"
    t.integer  "number_of_sms", default: 0
    t.boolean  "active",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sms_accounts", ["school_id"], name: "index_sms_accounts_on_school_id", unique: true, using: :btree

  create_table "sms_service_configurations", force: true do |t|
    t.string   "phone_number"
    t.string   "api_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_balances", force: true do |t|
    t.integer  "amount",           default: 0
    t.integer  "school_id",                       null: false
    t.string   "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reference"
    t.boolean  "due",              default: true
    t.string   "transaction_id"
    t.string   "channel"
    t.string   "msisdn"
    t.string   "defaulter_amount"
  end

  add_index "student_balances", ["school_id"], name: "index_student_balances_on_school_id", using: :btree
  add_index "student_balances", ["student_id"], name: "index_student_balances_on_student_id", using: :btree
  add_index "student_balances", ["transaction_id"], name: "index_student_balances_on_transaction_id", unique: true, using: :btree

  create_table "student_defaulter_settings", force: true do |t|
    t.string   "amount"
    t.boolean  "current"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_subjects", force: true do |t|
    t.integer  "subject_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.integer  "school_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "date_of_birth"
    t.string   "admission_number"
    t.string   "contact_number"
    t.integer  "batch_id"
    t.integer  "classification_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.integer  "course_section_id"
    t.integer  "defaulter_setting_id"
    t.string   "guardian_name"
    t.string   "guardian_phone"
    t.string   "guardian_email"
    t.string   "school_year"
    t.string   "avatar"
    t.integer  "card_id"
  end

  add_index "students", ["batch_id"], name: "index_students_on_batch_id", using: :btree
  add_index "students", ["card_id"], name: "index_students_on_card_id", using: :btree
  add_index "students", ["classification_id"], name: "index_students_on_classification_id", using: :btree
  add_index "students", ["course_id"], name: "index_students_on_course_id", using: :btree
  add_index "students", ["course_section_id"], name: "index_students_on_course_section_id", using: :btree
  add_index "students", ["defaulter_setting_id"], name: "index_students_on_defaulter_setting_id", using: :btree
  add_index "students", ["school_id"], name: "index_students_on_school_id", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "serial"
    t.string   "name"
    t.date     "date_of_birth"
    t.text     "educational_background"
    t.date     "date_of_joining"
    t.string   "designation"
    t.date     "date_of_MPO"
    t.string   "salary_scale_and_grade"
    t.string   "index_number"
    t.string   "mobile"
    t.string   "email"
    t.string   "part_time_or_full_time"
    t.string   "course_wise_department"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
  end

  create_table "transactions", force: true do |t|
    t.string   "amount"
    t.string   "transaction_type"
    t.string   "billable_type"
    t.integer  "billable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
    t.string   "school_id"
  end

  add_index "transactions", ["billable_id"], name: "index_transactions_on_billable_id", using: :btree
  add_index "transactions", ["school_id"], name: "index_transactions_on_school_id", using: :btree
  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.integer  "school_id"
    t.integer  "batch_id"
    t.integer  "course_id"
    t.string   "username"
    t.string   "role"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                        null: false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer  "to_be_authenticated_id"
    t.string   "to_be_authenticated_type"
    t.integer  "student_id"
    t.integer  "parent_id"
    t.string   "encrypted_password",              default: "", null: false
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["batch_id"], name: "index_users_on_batch_id", using: :btree
  add_index "users", ["course_id"], name: "index_users_on_course_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["parent_id"], name: "index_users_on_parent_id", using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  add_index "users", ["school_id"], name: "index_users_on_school_id", using: :btree
  add_index "users", ["to_be_authenticated_id"], name: "index_users_on_to_be_authenticated_id", using: :btree

end

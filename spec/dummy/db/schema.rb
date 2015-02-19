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

ActiveRecord::Schema.define(version: 20150219145346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "telehealth_prim_engine_consent_forms", force: :cascade do |t|
    t.date     "expires_on",              null: false
    t.string   "study_number", limit: 36, null: false
    t.string   "version",      limit: 36, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "telehealth_prim_engine_consent_forms", ["study_number", "version"], name: "index_consent_forms_on_study_number_and_version", unique: true, using: :btree

  create_table "telehealth_prim_engine_consent_notifications", force: :cascade do |t|
    t.integer  "telehealth_prim_engine_participant_id",  null: false
    t.datetime "sent_at",                                null: false
    t.integer  "telehealth_prim_engine_consent_form_id", null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "telehealth_prim_engine_consent_notifications", ["telehealth_prim_engine_consent_form_id"], name: "index_consent_notifications_on_consent_form_id", using: :btree
  add_index "telehealth_prim_engine_consent_notifications", ["telehealth_prim_engine_participant_id"], name: "index_consent_notifications_on_participant_id", unique: true, using: :btree

  create_table "telehealth_prim_engine_participants", force: :cascade do |t|
    t.string   "external_id", limit: 36, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "telehealth_prim_engine_participants", ["external_id"], name: "index_telehealth_prim_engine_participants_on_external_id", unique: true, using: :btree

  create_table "telehealth_prim_engine_pre_screening_answers", force: :cascade do |t|
    t.integer  "telehealth_prim_engine_pre_screening_question_id",            null: false
    t.integer  "position",                                                    null: false
    t.string   "label",                                            limit: 60, null: false
    t.string   "value",                                            limit: 36, null: false
    t.string   "kind",                                             limit: 36, null: false
    t.boolean  "eligible",                                                    null: false
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  add_index "telehealth_prim_engine_pre_screening_answers", ["telehealth_prim_engine_pre_screening_question_id", "position"], name: "index_pre_screening_answers_on_question_id_and_position", unique: true, using: :btree
  add_index "telehealth_prim_engine_pre_screening_answers", ["telehealth_prim_engine_pre_screening_question_id"], name: "index_pre_screening_answers_on_question_id", using: :btree

  create_table "telehealth_prim_engine_pre_screening_question_responses", force: :cascade do |t|
    t.integer  "telehealth_prim_engine_pre_screening_response_set_id", null: false
    t.integer  "telehealth_prim_engine_pre_screening_question_id",     null: false
    t.integer  "telehealth_prim_engine_pre_screening_answer_id",       null: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "telehealth_prim_engine_pre_screening_question_responses", ["telehealth_prim_engine_pre_screening_answer_id"], name: "index_pre_screening_responses_on_answer_id", using: :btree
  add_index "telehealth_prim_engine_pre_screening_question_responses", ["telehealth_prim_engine_pre_screening_question_id"], name: "index_pre_screening_responses_on_question_id", using: :btree
  add_index "telehealth_prim_engine_pre_screening_question_responses", ["telehealth_prim_engine_pre_screening_response_set_id"], name: "index_pre_screening_responses_on_response_set_id", using: :btree

  create_table "telehealth_prim_engine_pre_screening_questions", force: :cascade do |t|
    t.integer  "telehealth_prim_engine_pre_screening_id",            null: false
    t.string   "label",                                   limit: 60, null: false
    t.integer  "position",                                           null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "telehealth_prim_engine_pre_screening_questions", ["telehealth_prim_engine_pre_screening_id", "position"], name: "index_pre_screening_questions_on_pre_screening_id_and_position", unique: true, using: :btree
  add_index "telehealth_prim_engine_pre_screening_questions", ["telehealth_prim_engine_pre_screening_id"], name: "index_pre_screening_questions_on_pre_screening_id", using: :btree

  create_table "telehealth_prim_engine_pre_screening_response_sets", force: :cascade do |t|
    t.integer  "telehealth_prim_engine_pre_screening_id", null: false
    t.datetime "completed_at",                            null: false
    t.integer  "telehealth_prim_engine_participant_id",   null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "telehealth_prim_engine_pre_screening_response_sets", ["telehealth_prim_engine_participant_id"], name: "index_pre_screening_response_sets_on_participant_id", using: :btree
  add_index "telehealth_prim_engine_pre_screening_response_sets", ["telehealth_prim_engine_pre_screening_id"], name: "index_pre_screening_response_sets_on_pre_screening_id", using: :btree

  create_table "telehealth_prim_engine_pre_screenings", force: :cascade do |t|
    t.string   "version",    limit: 36, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "telehealth_prim_engine_pre_screenings", ["version"], name: "index_telehealth_prim_engine_pre_screenings_on_version", unique: true, using: :btree

  create_table "telehealth_prim_engine_users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "superuser",              default: false, null: false
    t.boolean  "researcher",             default: false, null: false
    t.boolean  "content_author",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "telehealth_prim_engine_users", ["email"], name: "index_telehealth_prim_engine_users_on_email", unique: true, using: :btree
  add_index "telehealth_prim_engine_users", ["reset_password_token"], name: "index_telehealth_prim_engine_users_on_reset_password_token", unique: true, using: :btree
  add_index "telehealth_prim_engine_users", ["unlock_token"], name: "index_telehealth_prim_engine_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "telehealth_prim_engine_consent_notifications", "telehealth_prim_engine_consent_forms"
  add_foreign_key "telehealth_prim_engine_consent_notifications", "telehealth_prim_engine_participants"
  add_foreign_key "telehealth_prim_engine_pre_screening_answers", "telehealth_prim_engine_pre_screening_questions"
  add_foreign_key "telehealth_prim_engine_pre_screening_question_responses", "telehealth_prim_engine_pre_screening_answers"
  add_foreign_key "telehealth_prim_engine_pre_screening_question_responses", "telehealth_prim_engine_pre_screening_questions"
  add_foreign_key "telehealth_prim_engine_pre_screening_question_responses", "telehealth_prim_engine_pre_screening_response_sets"
  add_foreign_key "telehealth_prim_engine_pre_screening_questions", "telehealth_prim_engine_pre_screenings"
  add_foreign_key "telehealth_prim_engine_pre_screening_response_sets", "telehealth_prim_engine_participants"
  add_foreign_key "telehealth_prim_engine_pre_screening_response_sets", "telehealth_prim_engine_pre_screenings"
end

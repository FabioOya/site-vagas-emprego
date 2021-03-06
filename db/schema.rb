# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_24_205757) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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

  create_table "apply_jobs", force: :cascade do |t|
    t.string "reason"
    t.integer "job_id", null: false
    t.integer "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "reject_feedback"
    t.integer "rejected", default: 0
    t.index ["job_id"], name: "index_apply_jobs_on_job_id"
    t.index ["profile_id"], name: "index_apply_jobs_on_profile_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_candidates_on_email", unique: true
    t.index ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_candidates_on_unlock_token", unique: true
  end

  create_table "commentaries", force: :cascade do |t|
    t.string "text"
    t.integer "head_hunter_id", null: false
    t.integer "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["head_hunter_id"], name: "index_commentaries_on_head_hunter_id"
    t.index ["profile_id"], name: "index_commentaries_on_profile_id"
  end

  create_table "head_hunters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_head_hunters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_head_hunters_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_head_hunters_on_unlock_token", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "skills"
    t.decimal "salary"
    t.string "job_level"
    t.date "end_date"
    t.string "location"
    t.integer "head_hunter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["head_hunter_id"], name: "index_jobs_on_head_hunter_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "full_name"
    t.string "social_name"
    t.date "birthdate"
    t.string "formation"
    t.string "description"
    t.string "experience"
    t.integer "candidate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "featured", default: 0
    t.index ["candidate_id"], name: "index_profiles_on_candidate_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.date "begin_date"
    t.decimal "salary"
    t.string "benefits"
    t.string "role"
    t.integer "head_hunter_id", null: false
    t.integer "job_id", null: false
    t.integer "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["head_hunter_id"], name: "index_proposals_on_head_hunter_id"
    t.index ["job_id"], name: "index_proposals_on_job_id"
    t.index ["profile_id"], name: "index_proposals_on_profile_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "apply_jobs", "jobs"
  add_foreign_key "apply_jobs", "profiles"
  add_foreign_key "commentaries", "head_hunters"
  add_foreign_key "commentaries", "profiles"
  add_foreign_key "jobs", "head_hunters"
  add_foreign_key "profiles", "candidates"
  add_foreign_key "proposals", "head_hunters"
  add_foreign_key "proposals", "jobs"
  add_foreign_key "proposals", "profiles"
end

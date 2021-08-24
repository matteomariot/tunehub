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

ActiveRecord::Schema.define(version: 2021_08_24_141800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_bands_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.time "time"
    t.bigint "member_id", null: false
    t.bigint "partition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_comments_on_member_id"
    t.index ["partition_id"], name: "index_comments_on_partition_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "band_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["band_id"], name: "index_members_on_band_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "partitions", force: :cascade do |t|
    t.string "title"
    t.string "instrument"
    t.bigint "song_id", null: false
    t.bigint "member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_partitions_on_member_id"
    t.index ["song_id"], name: "index_partitions_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "band_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["band_id"], name: "index_songs_on_band_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bands", "users"
  add_foreign_key "comments", "members"
  add_foreign_key "comments", "partitions"
  add_foreign_key "members", "bands"
  add_foreign_key "members", "users"
  add_foreign_key "partitions", "members"
  add_foreign_key "partitions", "songs"
  add_foreign_key "songs", "bands"
end

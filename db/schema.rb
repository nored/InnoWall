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

ActiveRecord::Schema.define(version: 20180402202855) do

  create_table "pictures", force: :cascade do |t|
    t.string "title"
    t.string "content_url"
    t.string "location"
    t.integer "wall_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wall_id"], name: "index_pictures_on_wall_id"
  end

  create_table "texts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "location"
    t.integer "wall_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wall_id"], name: "index_texts_on_wall_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "yt_id"
    t.string "location"
    t.integer "wall_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wall_id"], name: "index_videos_on_wall_id"
  end

  create_table "walls", force: :cascade do |t|
    t.string "url"
    t.integer "delete_after"
    t.boolean "allow_pictures"
    t.boolean "allow_videos"
    t.boolean "allow_text"
    t.boolean "restrict_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ownertoken"
    t.float "latitude"
    t.float "longitude"
  end

end

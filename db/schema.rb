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

ActiveRecord::Schema.define(version: 2019_02_12_214924) do

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cells", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dislikes", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_dislikes_on_post_id"
    t.index ["user_id"], name: "index_dislikes_on_user_id"
  end

  create_table "fusions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_fusions_on_board_id"
    t.index ["user_id"], name: "index_fusions_on_user_id"
  end

  create_table "goal_boards", force: :cascade do |t|
    t.string "name"
    t.date "deadline"
    t.boolean "finished"
    t.integer "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_goal_boards_on_board_id"
  end

  create_table "goal_cells", force: :cascade do |t|
    t.string "name"
    t.date "deadline"
    t.boolean "finished"
    t.integer "cell_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cell_id"], name: "index_goal_cells_on_cell_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "post_tags", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_tags_on_post_id"
    t.index ["tag_id"], name: "index_post_tags_on_tag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "content"
    t.string "photo"
    t.integer "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "project_users", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_users_on_project_id"
    t.index ["user_id"], name: "index_project_users_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.date "deadline"
    t.boolean "finished"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_boards", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "finished"
    t.integer "goal_board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_board_id"], name: "index_task_boards_on_goal_board_id"
  end

  create_table "task_cells", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "finished"
    t.integer "goal_cell_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_cell_id"], name: "index_task_cells_on_goal_cell_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "board_id"
    t.integer "cell_id"
    t.string "name"
    t.integer "age"
    t.integer "cell_kind"
    t.integer "board_kind"
    t.string "photo"
    t.boolean "creation_cell"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin"
    t.index ["board_id"], name: "index_users_on_board_id"
    t.index ["cell_id"], name: "index_users_on_cell_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

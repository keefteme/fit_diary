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

ActiveRecord::Schema[8.1].define(version: 2026_01_15_022600) do
  create_table "exercises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "muscle_group_id", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["muscle_group_id"], name: "index_exercises_on_muscle_group_id"
  end

  create_table "food_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "food_entries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date_eaten"
    t.integer "meal_type_id", null: false
    t.integer "product_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "weight_grams"
    t.index ["meal_type_id"], name: "index_food_entries_on_meal_type_id"
    t.index ["product_id"], name: "index_food_entries_on_product_id"
    t.index ["user_id"], name: "index_food_entries_on_user_id"
  end

  create_table "meal_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date_taken"
    t.float "hip"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.float "waist"
    t.float "weight"
    t.index ["user_id"], name: "index_measurements_on_user_id"
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "calories"
    t.float "carbs"
    t.datetime "created_at", null: false
    t.float "fats"
    t.integer "food_category_id", null: false
    t.string "name"
    t.float "proteins"
    t.datetime "updated_at", null: false
    t.index ["food_category_id"], name: "index_products_on_food_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workout_items", force: :cascade do |t|
    t.string "comment"
    t.datetime "created_at", null: false
    t.integer "exercise_id", null: false
    t.datetime "updated_at", null: false
    t.integer "workout_id", null: false
    t.index ["exercise_id"], name: "index_workout_items_on_exercise_id"
    t.index ["workout_id"], name: "index_workout_items_on_workout_id"
  end

  create_table "workout_sets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "reps"
    t.datetime "updated_at", null: false
    t.float "weight"
    t.integer "workout_item_id", null: false
    t.index ["workout_item_id"], name: "index_workout_sets_on_workout_item_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date_performed"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "exercises", "muscle_groups"
  add_foreign_key "food_entries", "meal_types"
  add_foreign_key "food_entries", "products"
  add_foreign_key "food_entries", "users"
  add_foreign_key "measurements", "users"
  add_foreign_key "products", "food_categories"
  add_foreign_key "workout_items", "exercises"
  add_foreign_key "workout_items", "workouts"
  add_foreign_key "workout_sets", "workout_items"
  add_foreign_key "workouts", "users"
end

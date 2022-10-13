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

ActiveRecord::Schema[7.0].define(version: 2022_10_11_115631) do
  create_table "resource_statuses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "type", null: false, comment: "リソースタイプ"
    t.string "name", null: false, comment: "リソース名"
    t.bigint "version", default: 0, comment: "バージョン"
    t.string "target_date", comment: "ターゲット日付"
    t.datetime "last_updated_at", default: -> { "CURRENT_TIMESTAMP(6)" }, null: false, comment: "ファイル更新日時"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP(6)" }, null: false, comment: "作成日時"
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)" }, null: false, comment: "更新日時"
    t.index ["type", "name"], name: "index_resource_statuses_on_type_and_name", unique: true
  end

  create_table "tests", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "column1", comment: "カラム１"
    t.string "column2", comment: "カラム２"
    t.string "column3", comment: "カラム３"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_test_ones", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "work_column1", comment: "workカラム１"
    t.string "work_column2", comment: "workカラム２"
    t.string "work_column3", comment: "workカラム３"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_test_twos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "work_column4", comment: "workカラム４"
    t.string "work_column5", comment: "workカラム５"
    t.string "work_column6", comment: "workカラム６"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

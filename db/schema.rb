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

# SET GLOBAL innodb_file_format=Barracuda;
# SET GLOBAL innodb_file_per_table=ON;
# ROW_FORMAT=DYNAMIC; -- or COMPRESSED (goes on end of CREATE)
# innodb_large_prefix=1

ActiveRecord::Schema.define(version: 2019_07_01_042333) do
  create_table "clock_events", options: "ENGINE=InnoDB  ROW_FORMAT=DYNAMIC DEFAULT CHARSET=utf8 innodb_large_prefix=1 innodb_file_format=Barracuda", force: :cascade do |t|
    t.string "clocktype"
    t.datetime "time"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_clock_events_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB  ROW_FORMAT=DYNAMIC DEFAULT CHARSET=utf8 innodb_large_prefix=1 innodb_file_format=Barracuda", force: :cascade do |t|
    t.string "first_name", varchar(191)
    t.string "last_name", varchar(191)
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "clock_events", "users"
end

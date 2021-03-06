# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_210_729_184_324) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cars', force: :cascade do |t|
    t.bigint 'category_id', null: false
    t.string 'name'
    t.decimal 'price', precision: 10, scale: 2
    t.boolean 'rented'
    t.string 'url_image'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['category_id'], name: 'index_cars_on_category_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.string 'author'
    t.text 'body'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'rents', force: :cascade do |t|
    t.bigint 'car_id', null: false
    t.string 'name'
    t.date 'date_start'
    t.date 'date_end'
    t.decimal 'price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['car_id'], name: 'index_rents_on_car_id'
  end

  add_foreign_key 'cars', 'categories'
  add_foreign_key 'rents', 'cars'
end

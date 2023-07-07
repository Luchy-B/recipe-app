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

ActiveRecord::Schema[7.0].define(version: 20_230_705_090_707) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'recipe_foods', force: :cascade do |t|
    t.integer 'quantity'
    t.bigint 'recipe_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['recipe_id'], name: 'index_recipe_foods_on_recipe_id'
  end

  create_table 'recipes', force: :cascade do |t|
    t.string 'name'
    t.string 'preparation_time'
    t.string 'cooking_time'
    t.text 'description'
    t.boolean 'public'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_recipes_on_user_id'
  end

  add_foreign_key 'recipe_foods', 'recipes'
  add_foreign_key 'recipes', 'users'
end

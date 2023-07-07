# frozen_string_literal: true

# Create a class 'CreateRecipes' that inherits from 'ActiveRecord::Migration'
# This class will create a new table called 'recipes'
class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :preparation_time
      t.string :cooking_time
      t.text :description
      t.boolean :public
      t.references :user, null: false, foreign_key: true


      t.timestamps
    end
  end
end

# frozen_string_literal: true

# Create a class 'CreateRecipeFoods' that inherits from 'ActiveRecord::Migration'
# This class will create a new table called 'recipe_foods'
class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end

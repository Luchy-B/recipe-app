class CreateJoinTableFoodsRecipes < ActiveRecord::Migration[7.0]
  def change
    create_join_table :foods, :recipes do |t|
      t.index [:food_id, :recipe_id] # Ensure the index is defined properly
    end
  end
end

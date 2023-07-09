class AddRecipeIdToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :ingredients, :recipe, null: true, foreign_key: true
  end
end

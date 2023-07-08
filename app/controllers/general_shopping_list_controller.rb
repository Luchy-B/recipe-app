class GeneralShoppingListController < ApplicationController
  before_action :authenticate_user!

  def index
    user_food_ids = current_user.foods.pluck(:id)
    missing_foods = []

    @recipes = Recipe.where(user_id: current_user.id)
    @recipes.each do |recipe|
      recipe_food_ids = recipe.foods.pluck(:id)
      missing_foods += recipe_food_ids - user_food_ids
    end

    @missing_foods = Food.where(id: missing_foods)
    @total_items = @missing_foods.count
    @total_price = @missing_foods.sum(:price)
  end
end

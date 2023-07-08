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

    @recipe_ingredients = Ingredient.joins(:recipe).where(recipe_id: @recipes.pluck(:id))
    @recipe_length = @recipe_ingredients.length
    @total_price = @recipe_ingredients.sum(:value)
  end

  def counts
    @total_items = calculate_total_items
    @total_price = calculate_total_price

    render partial: 'counts', locals: { total_items: @total_items, total_price: @total_price }
  end

  private

  def calculate_total_items
    user_food_ids = current_user.foods.pluck(:id)
    missing_foods = []

    @recipes.each do |recipe|
      recipe_food_ids = recipe.foods.pluck(:id)
      missing_foods += recipe_food_ids - user_food_ids
    end

    Food.where(id: missing_foods).count
  end

  def calculate_total_price
    user_food_ids = current_user.foods.pluck(:id)
    missing_foods = []

    @recipes.each do |recipe|
      recipe_food_ids = recipe.foods.pluck(:id)
      missing_foods += recipe_food_ids - user_food_ids
    end

    Food.where(id: missing_foods).sum(:price)
  end
end

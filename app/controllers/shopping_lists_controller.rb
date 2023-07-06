class ShoppingListsController < ApplicationController
    def show
      @user = User.find(params[:user_id])
      @recipes = @user.recipes.includes(:food_items)
      @general_food_list = @user.foods
      @missing_food_list = calculate_missing_food_list(@recipes, @general_food_list)
      @total_food_items = @missing_food_list.count
      @total_price = calculate_total_price(@missing_food_list)
    end
  
    private
  
    def calculate_missing_food_list(recipes, general_food_list)
      missing_food_list = []
      recipes.each do |recipe|
        recipe.food_items.each do |required_food_item|
          missing_food_list << required_food_item unless general_food_list.include?(required_food_item)
        end
      end
      missing_food_list
    end
  
    def calculate_total_price(food_items)
      food_items.sum(:price)
    end
  end
  

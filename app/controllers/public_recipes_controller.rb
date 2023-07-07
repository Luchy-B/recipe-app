# frozen_string_literal: true

# Controller for displaying public recipes
class PublicRecipesController < ApplicationController
  # Lists all public recipes with associated users
  def index
    @recipes = Recipe.where(public: true).includes(:user)
  end
end

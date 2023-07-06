class PublicRecipesController < ApplicationController

    def index
      @recipes = Recipe.where(public: true).includes(:user)
    end
  end
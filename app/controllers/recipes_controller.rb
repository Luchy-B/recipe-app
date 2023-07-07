# Controller for managing recipes
class RecipesController < ApplicationController
  # Lists all recipes
  def index
    @recipes = Recipe.all
  end

  # Shows details of a specific recipe
  def show
    @recipe = Recipe.find(params[:id])
  end

  # Displays a form to create a new recipe
  def new
    @recipe = Recipe.new
  end

  # Creates a new recipe
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      @errors = @recipe.errors.full_messages
      render :new
    end
  end

  # Displays a form to edit an existing recipe
  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: 'Recipe updated!'
    else
      @errors = @recipe.errors.full_messages
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path, notice: "#{recipe.name} deleted!"
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end

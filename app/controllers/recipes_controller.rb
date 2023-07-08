# Controller for managing recipes
class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: %i[show edit update destroy toggle_public]

  # Lists all recipes
  def index
    @recipes = Recipe.all
    # @recipes = Recipe.where(user_id: current_user.id)
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
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # Displays a form to edit an existing recipe
  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_public
    recipe = Recipe.find(params[:id])
    toggle_status = recipe[:public]
    toggle_status = !toggle_status
    recipe[:public] = toggle_status
    # return unless recipe.save
    if recipe.save!
      redirect_to recipe_path(id: recipe.id)
    else
      render :show, notice: 'An error occured'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:id, :name, :preparation_time, :cooking_time, :description, :public)
  end
end

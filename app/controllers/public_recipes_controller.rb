class PublicRecipesController < ApplicationController
  before_action :set_public_recipe, only: %i[ show edit update destroy ]

  # GET /public_recipes or /public_recipes.json
  def index
    @public_recipes = PublicRecipe.all
  end

  # GET /public_recipes/1 or /public_recipes/1.json
  def show
  end

  # GET /public_recipes/new
  def new
    @public_recipe = PublicRecipe.new
  end

  # GET /public_recipes/1/edit
  def edit
  end

  # POST /public_recipes or /public_recipes.json
  def create
    @public_recipe = PublicRecipe.new(public_recipe_params)

    respond_to do |format|
      if @public_recipe.save
        format.html { redirect_to public_recipe_url(@public_recipe), notice: "Public recipe was successfully created." }
        format.json { render :show, status: :created, location: @public_recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @public_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /public_recipes/1 or /public_recipes/1.json
  def update
    respond_to do |format|
      if @public_recipe.update(public_recipe_params)
        format.html { redirect_to public_recipe_url(@public_recipe), notice: "Public recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @public_recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @public_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /public_recipes/1 or /public_recipes/1.json
  def destroy
    @public_recipe.destroy

    respond_to do |format|
      format.html { redirect_to public_recipes_url, notice: "Public recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_button
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_public_recipe
      @public_recipe = PublicRecipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def public_recipe_params
      params.require(:public_recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
    end
end

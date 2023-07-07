require "test_helper"

class PublicRecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @public_recipe = public_recipes(:one)
  end

  test "should get index" do
    get public_recipes_url
    assert_response :success
  end

  test "should get new" do
    get new_public_recipe_url
    assert_response :success
  end

  test "should create public_recipe" do
    assert_difference("PublicRecipe.count") do
      post public_recipes_url, params: { public_recipe: { cooking_time: @public_recipe.cooking_time, description: @public_recipe.description, name: @public_recipe.name, preparation_time: @public_recipe.preparation_time, public: @public_recipe.public } }
    end

    assert_redirected_to public_recipe_url(PublicRecipe.last)
  end

  test "should show public_recipe" do
    get public_recipe_url(@public_recipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_public_recipe_url(@public_recipe)
    assert_response :success
  end

  test "should update public_recipe" do
    patch public_recipe_url(@public_recipe), params: { public_recipe: { cooking_time: @public_recipe.cooking_time, description: @public_recipe.description, name: @public_recipe.name, preparation_time: @public_recipe.preparation_time, public: @public_recipe.public } }
    assert_redirected_to public_recipe_url(@public_recipe)
  end

  test "should destroy public_recipe" do
    assert_difference("PublicRecipe.count", -1) do
      delete public_recipe_url(@public_recipe)
    end

    assert_redirected_to public_recipes_url
  end
end

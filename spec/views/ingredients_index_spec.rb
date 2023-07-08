# spec/views/ingredients/new.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'ingredients/new', type: :view do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }
  let(:recipe) { Recipe.create(name: 'Delicious Recipe', preparation_time: 30, cooking_time: 60, description: 'This is a delicious recipe', public: true, user_id: user.id) }

  before do
    assign(:ingredient, Ingredient.new)
    assign(:recipe, recipe)
    render
  end

  it 'renders the new ingredient form' do
    expect(rendered).to have_selector('h1', text: 'New Ingredient')

    expect(rendered).to have_selector('form[action="' + recipe_ingredients_path(recipe) + '"]')

    expect(rendered).to have_selector('label[for="ingredient_name"]')
    expect(rendered).to have_selector('input#ingredient_name[type="text"]')

    expect(rendered).to have_selector('label[for="ingredient_quantity"]')
    expect(rendered).to have_selector('input#ingredient_quantity[type="number"]')

    expect(rendered).to have_selector('label[for="ingredient_value"]')
    expect(rendered).to have_selector('input#ingredient_value[type="text"]')

    expect(rendered).to have_selector('input[type="submit"][value="Create Ingredient"]')
  end
end

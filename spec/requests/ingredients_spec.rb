require 'rails_helper'

RSpec.describe Ingredient, type: :model do

  describe 'attributes' do
    it 'has name, quantity, and value attributes' do
      ingredient = Ingredient.new
      expect(ingredient).to have_attributes(name: nil, quantity: nil, value: nil)
    end
  end
end



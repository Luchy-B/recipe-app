require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'callbacks' do
    describe '#set_public' do
      it 'sets public attribute to false before saving' do
        recipe = Recipe.new
        recipe.save
        expect(recipe.public).to be(false)
      end

      it 'does not change public attribute if already set' do
        recipe = Recipe.new(public: true)
        recipe.save
        expect(recipe.public).to be(true)
      end
    end
  end
end

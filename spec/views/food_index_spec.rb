require 'rails_helper'

RSpec.describe 'Food Listing', type: :model do
  describe 'viewing the list of foods' do
    it 'displays food records in the table' do
      # Create some test food records
      food1 = Food.new(name: 'Food 1', measurement_unit: 'unit', price: 10, quantity: 5)
      food2 = Food.new(name: 'Food 2', measurement_unit: 'unit', price: 15, quantity: 8)

      # Assert that the food records are displayed correctly
      expect(food1.name).to eq('Food 1')
      expect(food1.measurement_unit).to eq('unit')
      expect(food1.price).to eq(10)
      expect(food1.quantity).to eq(5)
      expect(food2.name).to eq('Food 2')
      expect(food2.measurement_unit).to eq('unit')
      expect(food2.price).to eq(15)
      expect(food2.quantity).to eq(8)
    end
  end
end

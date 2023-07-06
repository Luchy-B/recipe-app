class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  attribute :quantity, :integer, default: 1
  validates :quantity, numericality: { greater_than: 0 }
end

class Ingredient < ApplicationRecord
  belongs_to :recipe
  attribute :name, :string
  attribute :quantity, :integer
  attribute :value, :decimal
end

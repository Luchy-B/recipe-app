# frozen_string_literal: true

# Represents a Recipes in the system
class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :recipe_foods, foreign_key: :recipe_id
end

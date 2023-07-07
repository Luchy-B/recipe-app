# Represents a Recipes in the system
class Recipe < ApplicationRecord
  
  before_save :set_public

  belongs_to :user, foreign_key: :user_id
  has_many :recipe_foods, foreign_key: :recipe_id

  private

  def set_public
    self.public ||= false
  end
end

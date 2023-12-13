class RecipeIngredient < ApplicationRecord 
  belongs_to :recipe
  belongs_to :ingredient

  def ingredient_exist?(recipe_id, ingredient_id)
    RecipeIngredient.where(recipe_id: recipe_id, ingredient_id: ingredient)
  end
end
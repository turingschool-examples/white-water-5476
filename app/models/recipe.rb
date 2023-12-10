class Recipe < ApplicationRecord
   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients
   validates_presence_of :name, :complexity, :genre

   def total_ingredient_cost
      self.ingredients.sum(:cost)
   end
end
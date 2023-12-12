class Ingredient < ApplicationRecord
   validates_presence_of :name, :cost
   has_many :recipe_ingredients
   has_many :recipes, through: :recipe_ingredients

   def total_cost
      Ingredient.select(:cost).joins(:recipes)
   end

   def self.sort_alphabetically(column)
      Ingredient.order(column)
   end
end

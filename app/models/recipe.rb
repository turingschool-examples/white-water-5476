class Recipe < ApplicationRecord
   validates_presence_of :name, :complexity, :genre
   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients

   def total_cost 
      Recipe.select("SUM(ingredients.cost) AS total").joins(recipe_ingredients: :ingredient)[0].total
   end
   
end
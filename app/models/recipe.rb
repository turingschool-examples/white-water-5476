class Recipe < ApplicationRecord
   validates_presence_of :name, :complexity, :genre
   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients

   def list_of_ingredient_names
      self.ingredients.pluck(:name)
   end

   def total_cost
      self.ingredients.sum do |ingredient|
         ingredient.cost
      end
   end

end
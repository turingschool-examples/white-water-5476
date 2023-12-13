class Recipe < ApplicationRecord
   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients
   validates_presence_of :name, :complexity, :genre

   def total_cost
      total = 0
      self.ingredients.each do |i|
         total += i.cost
      end
      total
   end
end
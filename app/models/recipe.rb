class Recipe < ApplicationRecord
   validates_presence_of :name, :complexity, :genre

   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients

   def total_cost
      ingredients.sum(:cost)
   end

   def add_ingredient_to_recipe(ingredient_id)
      ingredient = Ingredient.find_by(id: ingredient_id)
      self.ingredients << ingredient
   end
end
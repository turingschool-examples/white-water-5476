class Recipe < ApplicationRecord
   validates_presence_of :name, :complexity, :genre
   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients

   def total_cost
      ingredients.sum(:cost)
   end

   def add_ingredients(id)
      ingredients.create(name: Ingredient.where(id: id).pluck(:name).first, cost: Ingredient.where(id: id).pluck(:cost).first)
   end
end

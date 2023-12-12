class Recipe < ApplicationRecord
   validates_presence_of :name, :complexity, :genre
   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients

   def list_of_ingredients
      ingredient_ids = RecipeIngredient.where("recipe_id = ?", self.id).pluck(:ingredient_id)
      ingredients = Ingredient.where(id: ingredient_ids)
   end

   def list_of_ingredient_names
      self.list_of_ingredients.map do |ingredient|
         ingredient.name
      end
   end

   def total_cost
      self.list_of_ingredients.sum do |ingredient|
         ingredient.cost
      end
   end

end
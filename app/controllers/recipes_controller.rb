class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @total_cost = @recipe.total_cost
  end

  def create
    @recipe = Recipe.find(params[:id])
    RecipeIngredient.create!(recipe_id: @recipe.id, ingredient_id: params[:add_ingredient] )
  
    redirect_to "/recipes/#{@recipe.id}"
  end

end 
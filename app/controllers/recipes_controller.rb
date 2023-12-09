class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
  end

  def create_ingredient
    @recipe = Recipe.find(params[:id])
    input_id = params[:New].to_i
    @recipe.ingredients << Ingredient.find(input_id)
    redirect_to "/recipes/#{@recipe.id}"
  end
end

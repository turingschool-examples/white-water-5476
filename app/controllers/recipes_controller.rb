class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def add_ingredient
    @recipe = Recipe.find(params[:id])
    @recipe.add_ingredient_to_recipe(params[:ingredient_id])

    redirect_to "/recipes/#{@recipe.id}"
  end
end

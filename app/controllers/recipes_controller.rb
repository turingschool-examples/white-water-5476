class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.list_of_ingredients
  end

end
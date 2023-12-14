class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @ingredient_names = @recipe.list_of_ingredient_names
  end

end
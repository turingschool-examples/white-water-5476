class RecipeIngredientsController < ApplicationController
  def create
    recipe_ingredient = RecipeIngredient.new(recipe_id: params[:recipe_id], ingredient_id: params[:ingredient_id])
      if recipe_ingredient.save
        flash[:notice] = "#{recipe_ingredient.ingredient.name} has successfully been added."
      else
        flash[:alert] = "Houston, it appears we have a problem. I don't think we carry that ingredient."
      end
    redirect_to "/recipes/#{params[:recipe_id]}"
  end
end
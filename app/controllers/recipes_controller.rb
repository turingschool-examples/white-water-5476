class RecipesController < ApplicationController
  def index 
   @recipes= Recipe.all
  end

  def show 
    @recipes=Recipe.all
    @recipe=Recipe.find(params[:id])
  end
end 
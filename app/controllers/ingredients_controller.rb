class IngredientsController < ApplicationController
  
  def index 
  @ingredients = Ingredient.alphabetized
  end
end
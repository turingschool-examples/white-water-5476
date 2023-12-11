class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.alphabetical_ingredients
  end
end

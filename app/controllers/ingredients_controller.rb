class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.sort_alphabetically(:name)
  end

  def new

  end

  def create

  end

  def edit

  end

  def update
    ingredient = Ingredient.create(ingredient_params)
    ingredient.update
    redirect_to show
  end

  def show

  end

  def destroy

  end

  private

  def ingredient_params
    params.permit(:name, :cost)
  end
end

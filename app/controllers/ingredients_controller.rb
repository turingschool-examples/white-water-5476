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

  end

  def show

  end

  def destroy

  end
end

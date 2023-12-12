class RecipesController < ApplicationController
def index

end

def new

end

def create

end

def edit

end

def update
  @recipe = Recipe.find(params[:id])
  @recipe.add_ingredients(params[:ingredient_id])

  redirect_to show_recipe_path
end

def show
  @recipe = Recipe.find(params[:id])
end

def destroy

end
end

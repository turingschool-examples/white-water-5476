class RecipeIngredientsController < ApplicationController
    def new
        @recipe = Recipe.find(params[:id])
    end

    def create
        recipe = Recipe.find(params[:id])
        recipe.ingredients.create(ingredient_params)

        redirect_to "/recipes/#{recipe.id}"
    end

    private

    def ingredient_params
        params.permit(:name, :cost)
    end
end
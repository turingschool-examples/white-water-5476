class IngredientsController < ApplicationController
    def index
        @recipe = Recipe.all
    end
end
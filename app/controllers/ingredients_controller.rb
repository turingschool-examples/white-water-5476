class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.order_alphabetically_by_name
    end
end
class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.order_by_recently_created
    end
end
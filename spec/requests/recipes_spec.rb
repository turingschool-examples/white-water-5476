require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "GET /show" do

    before do
      @recipe = Recipe.create!(name: "Spaghetti with Meatballs", complexity: 1, genre: "Italian")
    end

    it "returns http success" do
      get "/recipes/#{@recipe.id}"
      expect(response).to have_http_status(:success)
    end
  end

end

require "rails_helper"

RSpec.describe "Show Page" do
  before(:each) do
    @recipe_1 = Recipe.create(name: "Spaghetti", complexity: 5, genre: "Italian")
    @recipe_2 = Recipe.create(name: "Pot Roast", complexity: 6, genre: "American")
  end

  describe "user story 2" do
    it "displays the recipe's name, complexity, and genre" do
      visit '/recipes/:id'

      expect(page).to have_content("Spaghetti")
      expect(page).to have_content("Pot Roast")
      expect(page).to have_content(5)
      expect(page).to have_content(6)
      expect(page).to have_content("Italian")
      expect(page).to have_content("American")
      page
    end

    it "displays a list of the names of the ingredients for the recipe" do
      visit '/recipes/:id
    end

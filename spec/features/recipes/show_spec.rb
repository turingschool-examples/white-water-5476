require "rails_helper"

RSpec.describe "Show Page" do
  before(:each) do
    @recipe_1 = Recipe.create(name: "Spaghetti", complexity: 5, genre: "Italian")
    @recipe_2 = Recipe.create(name: "Pot Roast", complexity: 6, genre: "American")
    @ingredient_1 = @recipe_1.ingredients.create(name: "Paprika", cost: 3)
    @ingredient_2 =  @recipe_1.ingredients.create(name: "Garlic Powder", cost: 3)
    @ingredient_3 = @recipe_1.ingredients.create(name: "Ground beef", cost: 4)
  end

  describe "user story 2" do
    it "displays the recipe's name, complexity, and genre" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content("Spaghetti")
      expect(page).to have_content(5)
      expect(page).to have_content("Italian")
      page
    end

    it "displays a list of the names of the ingredients for the recipe" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content("Paprika")
      expect(page).to have_content("Ground beef")
      expect(page).to have_content("Garlic Powder")
    end
  end
end

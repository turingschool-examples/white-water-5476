require "rails_helper"

RSpec.describe "Show Page" do
  before(:each) do
    @recipe_1 = Recipe.create(name: "Spaghetti", complexity: 5, genre: "Italian")
    @recipe_2 = Recipe.create(name: "Pot Roast", complexity: 6, genre: "American")
    @ingredient_1 = @recipe_1.ingredients.create(name: "Paprika", cost: 3)
    @ingredient_2 =  @recipe_1.ingredients.create(name: "Garlic Powder", cost: 3)
    @ingredient_3 = @recipe_1.ingredients.create(name: "Ground beef", cost: 4)
  end

  describe "User Story 2" do
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

  describe "User Story 3" do
    it "displays the total cost of all ingredients in the recipe" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content("Total Cost: #{@recipe_1.total_cost}")
    end
  end

  describe "Extension 2" do
    it "displays a form to add an ingredient to this recipe" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_button("Add Ingredient")
    end

    it "has a text field to add an existing ingredient's ID" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content("Ingredient ID:")
    end

    it "will redirect back to the recipe's show page with new ingredient when form is filled and submitted" do
      pasta = Ingredient.create(id: 4, name: "Pasta", cost: 2)

      visit "/recipes/#{@recipe_1.id}"
      fill_in("Ingredient ID:", with: pasta.id)
      click_button("Add Ingredient")

      expect(page.current_path).to eq("/recipes/#{@recipe_1.id}")
      expect(page).to have_content("Pasta")
    end
  end
end

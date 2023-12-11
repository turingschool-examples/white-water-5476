require "rails_helper"

RSpec.describe "recipes show" do
  before do
    @recipe_1 = Recipe.create(name: "Spaghetti with Meatballs", complexity: 1, genre: "Italian")
    @ingredient_1 = Ingredient.create(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create(name: "Spices", cost: 4)
    @ingredient_3 = Ingredient.create(name: "Pasta Sauce", cost: 6)
    @ingredient_4 = Ingredient.create(name: "Spaghetti Noodles", cost: 4)
    @ingredient_5 = Ingredient.create(name: "Sardines", cost: 3)

    @recipe_1.ingredients << [@ingredient_1, @ingredient_2, @ingrediient_3, @ingredient_4]
  end

  it "displays the recipe name, complexity, genre, and ingredients" do
  #User Story 2 - Recipes Show

  #As a visitor,
  #When I visit '/recipes/:id',
  visit "/recipes/#{@recipe_1.id}"
  #Then I see the recipe's name, complexity and genre,
  expect(page).to have_content(@recipe_1.name)
  expect(page).to have_content(@recipe_1.complexity)
  expect(page).to have_content(@recipe_1.genre)
  #and I see a list of the names of the ingredients for the recipe.
  expect(page).to have_content(@ingredient_1.name)
  expect(page).to have_content(@ingredient_2.name)
  expect(page).to have_content(@ingredient_3.name)
  expect(page).to have_content(@ingredient_4.name)

  expect(page).to_not have_content(@ingredient_4.name)
  end
end

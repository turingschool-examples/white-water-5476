require "rails_helper"

RSpec.describe "the recipes show" do 
  meal = Recipe.create!(name: "spicy tacos", complexity: 1, genre: "mexican")

  item_1 = Ingredient.create!(name: "salt", cost: 1)
  item_2 = Ingredient.create!(name: "pepper", cost: 2)
  # User Story 2 - Recipes Show
  it "lists the the recipes attributes and  needed compenents" do
    # When I visit '/recipes/:id',
   visit "/recipes/#{meal.id}"
  # Then I see the recipe's name, complexity and genre,
  expect(page).to have_content(meal.name)
  expect(page).to have_content(meal.complexity)
  expect(page).to have_content(meal.genre)
  # and I see a list of the names of the ingredients for the recipe.
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_1.cost)
    expect(page).to have_content(item_2.cost)
  end
end
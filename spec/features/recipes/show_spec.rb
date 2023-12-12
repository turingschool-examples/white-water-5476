require "rails_helper"

RSpec.describe "the recipes show" do 
  meal = Recipe.create!(name: "spicy tacos", complexity: 1, genre: "mexican")

  item_1 = Ingredient.create!(name: "salt", cost: 1)
  item_2 = Ingredient.create!(name: "pepper", cost: 2)

  meal.ingredients << item_1 << item_2
  # RecipeIngredient.create!(recipe_id: meal.id, ingredient_id: item_1.id, ingredient_id: item_1.id)

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

  # User Story 3 - Total Cost
  it "can calculate the total cost of all ingredients" do 
  meal = Recipe.create!(name: "spicy tacos", complexity: 1, genre: "mexican")

  item_1 = Ingredient.create!(name: "salt", cost: 1)
  item_2 = Ingredient.create!(name: "pepper", cost: 2)

  meal.ingredients << item_1 << item_2
    # When I visit '/recipes/:id'
    visit "/recipes/#{meal.id}"
    # I see the total cost of all of the ingredients in the recipe.
    # (e.g. "Total Cost: 22")
    expect(page).to have_content("Total Cost: 3")
  end

  # Extension 2 - Add an Ingredient to a Recipe
  # xit "can add ingredients to a recipe" do
  #   meal = Recipe.create!(name: "spicy tacos", complexity: 1, genre: "mexican")

  #   item_1 = Ingredient.create!(name: "salt", cost: 1)
  #   item_2 = Ingredient.create!(name: "pepper", cost: 2)
  #   item_3 = Ingredient.create!(name: "spice", cost: 3)
    

  #   meal.ingredients << item_1 << item_2

  #   # When I visit '/recipes/:id'
  #   visit "/recipes/#{meal.id}"
  #   # Then I see a form to add an ingredient to this recipe.

    
  #   # When I fill in a field with an existing ingredient's ID,
  #   # And I click submit,
  #   # Then I am redirrected to the recipe's show page,
  #   # And I see the new ingredient listed for this recipe.
  # end
end
require "rails_helper"

RSpec.describe "Recipes Show" do
  it "displays a Recipes name, complexity and genre and a list of all the ingredients for the recipe" do
    # User Story 2 - Recipes Show
    enchiladas = Recipe.create!(name: "Enchiladas", complexity: 4, genre: "Tex-Mex")

    ground_beef = Ingredient.create!(name: "Ground Beef", cost: 2)
    cheese = Ingredient.create!(name: "Cheese", cost: 3)
    tomatillo = Ingredient.create!(name: "Tomatillo", cost: 5)

    enchiladas.ingredients << [ground_beef, cheese, tomatillo] 

    # As a visitor,
    # When I visit '/recipes/:id',
    visit "/recipes/#{enchiladas.id}"

    # Then I see the recipe's name, complexity and genre,
    expect(page).to have_content("Recipe ##{enchiladas.id}")
    expect(page).to have_content("Name: Enchiladas")
    expect(page).to have_content("Complexity: 4")
    expect(page).to have_content("Genre: Tex-Mex")

    # and I see a list of the names of the ingredients for the recipe.
    expect(page).to have_content("Ingredients for Enchiladas")
    expect(page).to have_content("Ground Beef")
    expect(page).to have_content("Cheese")
    expect(page).to have_content("Tomatillo")


  end
end
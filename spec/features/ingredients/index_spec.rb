require "rails_helper"

RSpec.describe "Ingredients Index" do
  it "displays all ingredients and their cost" do
    # User Story 1 - Ingredients Index
    Ingredient.create!(name: "Ground Beef", cost: 2)
    Ingredient.create!(name: "Salt", cost: 4)

    # As a visitor,
    # When I visit '/ingredients'
    visit "/ingredients"
    # I see a list of all the ingredients including their name and cost
    expect(page).to have_content("Ingredients")
    expect(page).to have_content("Ground Beef: 2")
    expect(page).to have_content("Salt: 4")
    # (e.g. "Ground Beef: 2"
    #     "Salt: 4")
  end

  it "sorts ingredients alphabetically" do
    # Extension 1 - Ingredients Sorted Alphabetically
    ground_beef = Ingredient.create!(name: "Ground Beef", cost: 2)
    cheese = Ingredient.create!(name: "Cheese", cost: 3)
    tomatillo = Ingredient.create!(name: "Tomatillo", cost: 5)
    tortilla = Ingredient.create!(name: "Tortilla", cost: 6)
    # As a visitor,
    # When I visit '/ingredients',
    visit "/ingredients"
    # Then I see that the list of ingredients is sorted alphabetically by name
    expect("Cheese").to appear_before("Ground Beef")
    expect("Ground Beef").to appear_before("Tomatillo")
    expect("Tomatillo").to appear_before("Tortilla")
  end
end
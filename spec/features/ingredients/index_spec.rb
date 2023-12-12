require "rails_helper"

RSpec.describe "Ingredients Index" do
  it "displays all ingredients and their cost" do
    # User Story 1 - Ingredients Index
    Ingredient.create!(name: "Ground Beef", cost: 2)
    Ingredient.create!(name: "Salt", cost: 4)

    # As a visitor,
    # When I visit '/ingredients'
    visit ".ingredients"
    # I see a list of all the ingredients including their name and cost
    expect(page).to have_content("Ingredients")
    expect(page).to have_content("Ground Beef: 2")
    expect(page).to have_content("Salt: 4")
    # (e.g. "Ground Beef: 2"
    #     "Salt: 4")
  end
end
   
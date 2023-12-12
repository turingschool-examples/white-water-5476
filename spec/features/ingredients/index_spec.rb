require "rails_helper"

RSspec.describe "the ingredients index" do 
  item_1 = Ingredient.create!(name: "salt", cost: 1)
  # User Story 1 - Ingredients Index
  it "lists all ingredients and their costs" do 
    # When I visit '/ingredients'
    visit "/ingredients"
    # I see a list of all the ingredients including their name and cost
    expect(page).to have_content()
  (e.g. "Ground Beef: 2"
       "Salt: 4")
  end
  
end

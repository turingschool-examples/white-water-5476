require "rails_helper"

RSpec.describe "Ingredients index" do
  before do
    @ingredient_1 = Ingredient.create(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create(name: "Salt", cost: 4)
  end
  
  it "includes all ingredients with name and cost" do
    #User Story 1 - Ingredients Index
    #As a visitor,
    #When I visit '/ingredients'
    visit "/ingredients"
  
    #I see a list of all the ingredients including their name and cost
    #(e.g. "Ground Beef: 2"
    #     "Salt: 4")
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_1.cost)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_2.name)
  end
end


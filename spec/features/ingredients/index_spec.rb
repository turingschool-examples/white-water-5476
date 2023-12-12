require "rails_helper"

RSpec.describe "the ingredients index" do 
  item_1 = Ingredient.create!(name: "salt", cost: 1)
  item_2 = Ingredient.create!(name: "pepper", cost: 2)

  # User Story 1 - Ingredients Index
  it "lists all ingredients and their costs" do 
    # When I visit '/ingredients'
    visit "/ingredients"
    # I see a list of all the ingredients including their name and cost
    # (e.g. "Ground Beef: 2"
    #      "Salt: 4")
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_1.cost)
    expect(page).to have_content(item_2.cost)
  end

  # # Extension 1 - Ingredients Sorted Alphabetically
  # xit "lists ingredients in alphabetically"
  #   # When I visit '/ingredients',
  #   visit '/ingredients'
  #   # Then I see that the list of ingredients is sorted alphabetically by name
    
  #   # https://github.com/jmondo/orderly found this. Having issues getting ti to work. Ik we've done it before but I cant recal where. 
  # end
end

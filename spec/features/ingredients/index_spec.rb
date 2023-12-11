require "rails_helper"

RSpec.describe "Ingredients index" do
  before do
    @recipe = Recipe.create(name: "Spaghetti with Meatballs", complexity: 1, genre: "Italian")

    @ingredient_1 = Ingredient.create(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create(name: "Spices", cost: 4)
    @ingredient_3 = Ingredient.create(name: "Pasta Sauce", cost: 6)
    @ingredient_4 = Ingredient.create(name: "Spaghetti Noodles", cost: 4)    

    @recipe.ingredients << [@ingredient_1, @ingredient_2, @ingredient_3, @ingredient_4]
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

  it "sorts ingredients alphabetically" do
    
    #As a visitor
    #When I visit '/ingredients',
    visit "/ingredients"
    
    #Then I see that the list of ingredients is sorted alphabetically by name
    #not sure if I was allowed to use orderly - if not, please omit the following. 
    expect("Ground Beef").to appear_before("Pasta Sauce")
    expect("Pasta Sauce").to appear_before("Spaghetti Noodles")
    expect("Spaghetti Noodles").to appear_before("Spices")
    #without orderly
    expect(@recipe.ingredients.alphabetical_ingredients).to eq([@ingredient_1, @ingredient_3, @ingredient_4, @ingredient_2])
  end
end


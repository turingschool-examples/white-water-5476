require "rails_helper"

RSpec.describe "Ingredients index" do
  before do
    @ingredient_1 = Ingredient.create(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create(name: "Spices", cost: 4)
    @ingredient_3 = Ingredient.create(name: "Pasta Sauce", cost: 6)
    @ingredient_4 = Ingredient.create(name: "Spaghetti Noodles", cost: 4)
    @ingredient_5 = Ingredient.create(name: "Sardines", cost: 3)
    
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
    expect(@ingredient_1.name).to appear_before(@ingredient_3.name)
    expect(@ingredient_3.name).to appear_before(@ingredient_5.name)
    expect(@ingredient_5.name).to appear_before(@ingredient_4.name)
    expect(@ingredient_4.name).to appear_before(@ingredient_2.name)

    expect(Ingredients.alphabetical_ingredients).to eq([@ingredient_1, @ingredient_3, @ingrediient_5, @ingredient_4, @ingredient_2])
  end
end


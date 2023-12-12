require "rails_helper"

RSpec.describe "the ingredients index" do
  before(:each) do
    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
    @ingredient_3 = Ingredient.create!(name: "Pepper", cost: 4)
    @ingredient_4 = Ingredient.create!(name: "Avocado", cost: 4)
  end

  it "lists all the ingredients attributes" do
    visit "/ingredients"
    
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_1.cost)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_2.cost)
  end
  
  it "sorts the ingredients alphabetically" do
    visit "/ingredients"

    expect(Ingredient.sort_alphabetically).to eq([@ingredient_4, @ingredient_1, @ingredient_3, @ingredient_2])
  end

end
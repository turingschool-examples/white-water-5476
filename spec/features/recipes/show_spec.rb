require "rails_helper"

RSpec.describe "the recipes show" do
  before(:each) do
    @recipe = Recipe.create!(name: "Salted Ground Beef", complexity: 1, genre: "Carnivore")
    @ingredient_1 = @recipe.ingredients.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = @recipe.ingredients.create!(name: "Salt", cost: 4)
  end

  it "lists all the recipes attributes" do
    visit "/recipes/#{@recipe.id}"
    
    expect(page).to have_content(@recipe.name)
    expect(page).to have_content(@recipe.complexity)
    expect(page).to have_content(@recipe.genre)
  end
  
  it "lists all the recipes ingredients" do
    visit "/recipes/#{@recipe.id}"
    
    expect(page).to have_content("Ground Beef")
    expect(page).to have_content(2)
    expect(page).to have_content("Ground Beef")
    expect(page).to have_content(4)
  end

  it "shows the total cost of all ingredients in the recipe" do
    visit "/recipes/#{@recipe.id}"

    expect(page).to have_content("Total Cost: 6")
  end

end
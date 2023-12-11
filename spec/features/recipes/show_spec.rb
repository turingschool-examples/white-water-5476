require "rails_helper"

RSpec.describe "the recipes show" do
  before(:each) do
    @recipe = Recipe.create!(name: "Salted Ground Beef", complexity: 1, genre: "Carnivore")
  end

  it "lists all the recipes attributes" do
    visit "/recipes/#{@recipe.id}"

    expect(page).to have_content(@recipe.name)
    expect(page).to have_content(@recipe.complexity)
    expect(page).to have_content(@recipe.genre)

  end

end
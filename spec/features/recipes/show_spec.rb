require "rails_helper"

RSpec.describe "the recipe show page" do
  it "shows the recipe and all its attributes" do
    beef_pasta = Recipe.create(name: "Beef Pasta", complexity: 2, genre: "Italian")

    visit "/recipes/#{beef_pasta.id}"

    expect(page).to have_content(beef_pasta.name)
    expect(page).to have_content(beef_pasta.complexity)
    expect(page).to have_content(beef_pasta.genre)
  end

  it "shows all of a recipe's ingredients, and their attributes" do
    beef_pasta = Recipe.create(name: "Beef Pasta", complexity: 2, genre: "Italian")
    ground_beef = beef_pasta.ingredients.create(name: "Ground Beef", cost: 4)
    garlic = beef_pasta.ingredients.create(name: "Garlic", cost: 2)
    tomato_paste = beef_pasta.ingredients.create(name: "Tomato Paste", cost: 1)

    visit "/recipes/#{beef_pasta.id}"

    expect(page).to have_content(ground_beef.name)
    # expect(page).to have_content(ground_beef.cost)
    expect(page).to have_content(garlic.name)
    # expect(page).to have_content(garlic.cost)
    expect(page).to have_content(tomato_paste.name)
    # expect(page).to have_content(tomato_paste.cost)
  end
end
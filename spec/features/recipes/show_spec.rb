require "rails_helper"

RSpec.describe "recipes show page", type: :feature do
  it "shows a recipe by id number with its attributes and a list of ingredients" do
    spaghet = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Pasta")
    cheese = spaghet.ingredients.create!(name: "Cheese", cost: 3)
    noods = spaghet.ingredients.create!(name: "Noodles", cost: 2)
    herbals = spaghet.ingredients.create!(name: "Herbs", cost: 1)
    sauce = spaghet.ingredients.create!(name: "Red Sauce", cost: 5)

    visit "/recipes/#{spaghet.id}"

    expect(current_path).to eq("/recipes/#{spaghet.id}")
    expect(page).to have_content(spaghet.name)
    expect(page).to have_content(spaghet.complexity)
    expect(page).to have_content(spaghet.genre)
    expect(page).to have_content(cheese.name)
    expect(page).to have_content(noods.name)
    expect(page).to have_content(herbals.name)
    expect(page).to have_content("Total Cost of Dish: $11")
  end
end

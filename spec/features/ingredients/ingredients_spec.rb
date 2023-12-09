require "rails_helper"

RSpec.describe "ingredients index page", type: :feature do
  it "shows a list of all ingredients with their attributes" do
    cheese = Ingredient.create!(name: "Cheese", cost: 3)
    noods = Ingredient.create!(name: "Noodles", cost: 2)
    herbals = Ingredient.create!(name: "Herbs", cost: 1)

    visit "/ingredients"

    expect(current_path).to eq("/ingredients")
    expect(page).to have_content(cheese.name)
    expect(page).to have_content(noods.name)
    expect(page).to have_content(herbals.name)
    expect(page).to have_content(cheese.cost)
    expect(page).to have_content(noods.cost)
    expect(page).to have_content(herbals.cost)
    expect(page).to have_content("Cheese: 3")
    expect(page).to have_content("Noodles: 2")
    expect(page).to have_content("Herbs: 1")
  end
end

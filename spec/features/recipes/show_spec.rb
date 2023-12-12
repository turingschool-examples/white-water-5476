require "rails_helper"

RSpec.describe "Recipe Show Page" do

  before(:each) do
    @bowl_of_cereal = Recipe.create!(name: "Bowl of Cereal", complexity: 1, genre: "Breakfast")
    @green_smoothie = Recipe.create!(name: "Green Smoothie", complexity: 2, genre: "Breakfast")
  end

  it "displays recipe details (name, complexity, and genre)" do
    visit "/recipes/#{@bowl_of_cereal.id}"

    expect(page).to have_content("Bowl of Cereal")
    expect(page).to have_content("1")
    expect(page).to have_content("Breakfast")

    visit "/recipes/#{@green_smoothie.id}"

    expect(page).to have_content("Green Smoothie")
    expect(page).to have_content("2")
    expect(page).to have_content("Breakfast")
  end

end
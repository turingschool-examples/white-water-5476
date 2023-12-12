require "rails_helper"

RSpec.describe "Recipe Show Page" do

  before(:each) do
    @milk = Ingredient.create!(name: "Milk", cost: 4)
    @cereal = Ingredient.create!(name: "Cereal", cost: 6)
    @banana = Ingredient.create!(name: "Banana", cost: 2)
    @pineapple = Ingredient.create!(name: "Pineapple", cost: 4)
    @spinach = Ingredient.create!(name: "Spinach", cost: 5)
    @white_grape_juice = Ingredient.create!(name: "White Grape Juice", cost: 4)

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

  it "lists ingredients" do
    visit "/recipes/#{@bowl_of_cereal.id}"

    expect(page).to have_content("Milk")
    expect(page).to have_content("Cereal")
    
    visit "/recipes/#{@green_smoothie.id}"

    expect(page).to have_content("Banana")
    expect(page).to have_content("Pineapple")
    expect(page).to have_content("Spinach")
    expect(page).to have_content("White Grape Juice")
  end

end
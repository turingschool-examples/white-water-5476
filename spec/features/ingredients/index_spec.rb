require "rails_helper"

RSpec.describe "Ingredients Index Page" do

  before(:each) do
    @milk = Ingredient.create!(name: "Milk", cost: 4)
    @cereal = Ingredient.create!(name: "Cereal", cost: 6)
    @banana = Ingredient.create!(name: "Banana", cost: 2)
    @pineapple = Ingredient.create!(name: "Pineapple", cost: 4)
    @spinach = Ingredient.create!(name: "Spinach", cost: 5)
    @white_grape_juice = Ingredient.create!(name: "White Grape Juice", cost: 4)
  end

  it "lists all ingredients (name and cost)" do
    visit "/ingredients"

    expect(page).to have_content("Milk")
    expect(page).to have_content(4)
    expect(page).to have_content("Cereal")
    expect(page).to have_content(6)
    expect(page).to have_content("Banana")
    expect(page).to have_content(2)
    expect(page).to have_content("Pineapple")
    expect(page).to have_content(4)
    expect(page).to have_content("Spinach")
    expect(page).to have_content(5)
    expect(page).to have_content("White Grape Juice")
    expect(page).to have_content(4)
  end

end
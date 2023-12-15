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

    within("#ingredients") do
      expect(page).to have_content("#{@milk.name}: #{@milk.cost}")
      expect(page).to have_content("#{@cereal.name}: #{@cereal.cost}")
      expect(page).to have_content("#{@banana.name}: #{@banana.cost}")
      expect(page).to have_content("#{@pineapple.name}: #{@pineapple.cost}")
      expect(page).to have_content("#{@spinach.name}: #{@spinach.cost}")
      expect(page).to have_content("#{@white_grape_juice.name}: #{@white_grape_juice.cost}")
    end
  end

end
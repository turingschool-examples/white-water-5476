require "rails_helper"

RSpec.describe "Index page" do
  before(:each) do 
    f_alfredo = Recipe.create!(name: "Fetuccini Alfredo", complexity: 1, genre: "Italian")
    chili = Recipe.create!(name: "Chili", complexity: 2, genre: "American")
    curry = Recipe.create!(name: "Curry", complexity: 3, genre: "Indian")

    pasta = Ingredient.create!(name:"Pasta", cost: 2)
    pasta_sauce = Ingredient.create!(name:"Pasta Sauce", cost: 2)
    parmesan = Ingredient.create!(name:"Parmesan", cost: 5)
    mushrooms = Ingredient.create!(name:"Mushrooms", cost: 2)
    salt = Ingredient.create!(name:"Salt", cost: 1)
    beans = Ingredient.create!(name:"Beans", cost: 2)
    tomatoes = Ingredient.create!(name:"Tomatoes", cost: 2)
    broth = Ingredient.create!(name:"Broth", cost: 2)
    chicken = Ingredient.create!(name:"Chicken", cost: 7)
    curry_paste = Ingredient.create!(name:"Curry Paste", cost: 2)
    coconut_milk = Ingredient.create!(name:"Coconut Milk", cost: 2)
    sweet_potatoes = Ingredient.create!(name:"Sweet Potatoes", cost: 2)
  end

    it "has an ingredient index page" do

      #User Story 1 - Ingredients Index
      # As a visitor,
      # When I visit '/ingredients'
      # I see a list of all the ingredients including their name and cost
      # (e.g. "Ground Beef: 2"
      #      "Salt: 4")

      visit "/ingredients"

      expect(page).to have_content("Chicken")
      expect(page).to have_content("Pasta")
      expect(page).to have_content("Pasta Sauce")
      expect(page).to have_content("Salt")
      expect(page).to have_content("Mushrooms")
      expect(page).to have_content("Sweet Potatoes")
      expect(page).to have_content(5)
      expect(page).to have_content(7)
      expect(page).to have_content(2)
    end




end
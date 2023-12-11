require "rails_helper"

RSpec.describe "Recipe show page" do
  before(:each) do 
    @f_alfredo = Recipe.create!(name: "Fetuccini Alfredo", complexity: 3, genre: "Italian")
    @chili = Recipe.create!(name: "Chili", complexity: 2, genre: "American")
    @curry = Recipe.create!(name: "Curry", complexity: 3, genre: "Indian")

    @pasta = Ingredient.create!(name:"Pasta", cost: 2)
    @pasta_sauce = Ingredient.create!(name:"Pasta Sauce", cost: 2)
    @parmesan = Ingredient.create!(name:"Parmesan", cost: 5)
    @mushrooms = Ingredient.create!(name:"Mushrooms", cost: 2)
    @salt = Ingredient.create!(name:"Salt", cost: 1)
    @beans = Ingredient.create!(name:"Beans", cost: 2)
    @tomatoes = Ingredient.create!(name:"Tomatoes", cost: 2)
    @broth = Ingredient.create!(name:"Broth", cost: 2)
    @chicken = Ingredient.create!(name:"Chicken", cost: 7)
    @curry_paste = Ingredient.create!(name:"Curry Paste", cost: 2)
    @coconut_milk = Ingredient.create!(name:"Coconut Milk", cost: 2)
    @sweet_potatoes = Ingredient.create!(name:"Sweet Potatoes", cost: 2)
  end

  it "has a recipe show page" do

    #User Story 2 - Recipes Show
    # As a visitor,
    # When I visit '/recipes/:id',
    # Then I see the recipe's name, complexity and genre,
    # and I see a list of the names of the ingredients for the recipe.

    visit "/recipes/#{@f_alfredo.id}"

    expect(page).to have_content("Fetuccini Alfredo")
    expect(page).to have_content(3)
    expect(page).to have_content("Italian")

    expect(page).to have_content(@pasta.name)
    expect(page).to have_content(@pasta_sauce.name)
    expect(page).to have_content(@salt.name)
    expect(page).to have_content(@parmesan.name)
    expect(page).to have_content(@mushrooms.name)


  end


end
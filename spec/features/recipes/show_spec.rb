require "rails_helper"

RSpec.describe "recipes show" do
  before do
    @recipe = Recipe.create(name: "Spaghetti with Meatballs", complexity: 1, genre: "Italian")
    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Spices", cost: 4)
    @ingredient_3 = Ingredient.create!(name: "Pasta Sauce", cost: 6)
    @ingredient_4 = Ingredient.create!(name: "Spaghetti Noodles", cost: 4)
    @ingredient_5 = Ingredient.create!(name: "Parmesean Cheese", cost: 3)

    @recipe.ingredients << [@ingredient_1, @ingredient_2, @ingredient_3, @ingredient_4]
  end

  it "displays the recipe name, complexity, genre, and ingredients" do
  #User Story 2 - Recipes Show

  #As a visitor,
  #When I visit '/recipes/:id',
    visit "/recipes/#{@recipe.id}"
  #Then I see the recipe's name, complexity and genre,
    expect(page).to have_content(@recipe.name)
    expect(page).to have_content(@recipe.complexity)
    expect(page).to have_content(@recipe.genre)
  #and I see a list of the names of the ingredients for the recipe.
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_3.name)
    expect(page).to have_content(@ingredient_4.name)

    expect(page).to_not have_content(@ingredient_5.name)
  end
  
  it "displays the total cost of the recipe" do
  #User Story 3 - Total Cost

  #As a visitor,
  #When I visit '/recipes/:id'
    visit "/recipes/#{@recipe.id}"
  #I see the total cost of all of the ingredients in the recipe.
    expect(page).to have_content("Total Cost: #{@recipe.total_cost}")
    expect(page).to_not have_content("Total Cost: 5")
    expect(page).to_not have_content("Total Cost: 999")
  #(e.g. "Total Cost: 22")
  end

  it "adds ingredients to a recipe" do
  #Extension 2 - Add an Ingredient to a Recipe

    #As a visitor
    #When I visit '/recipes/:id'
    visit "/recipes/#{@recipe.id}"

    #Then I see a form to add an ingredient to this recipe.
    expect(page).to have_content("Add an Ingredient:")

    #When I fill in a field with an existing ingredient's ID,
    fill_in "Ingredient ID", with: @ingredient_5.id

    #And I click submit,
    click_button 'Add Ingredient'

    #Then I am redirrected to the recipe's show page,
    expect(current_path).to eq("/recipes/#{@recipe.id}")
    #and I see the new ingredient listed for this recipe.
    expect(page).to have_content("Parmesean Cheese")
  end
end

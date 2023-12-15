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
    
    @recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: @bowl_of_cereal.id, ingredient_id: @milk.id)
    @recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: @bowl_of_cereal.id, ingredient_id: @cereal.id)
    
    @recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: @green_smoothie.id, ingredient_id: @banana.id)
    @recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: @green_smoothie.id, ingredient_id: @pineapple.id)
    @recipe_ingredient_5 = RecipeIngredient.create!(recipe_id: @green_smoothie.id, ingredient_id: @spinach.id)
    @recipe_ingredient_6 = RecipeIngredient.create!(recipe_id: @green_smoothie.id, ingredient_id: @white_grape_juice.id)
  end

  it "displays recipe details (name, complexity, and genre)" do
    visit "/recipes/#{@bowl_of_cereal.id}"

    expect(page).to have_content("#{@bowl_of_cereal.name}")
    expect(page).to have_content("Complexity: #{@bowl_of_cereal.complexity}")
    expect(page).to have_content("Genre: #{@bowl_of_cereal.genre}")

    visit "/recipes/#{@green_smoothie.id}"

    expect(page).to have_content("#{@green_smoothie.name}")
    expect(page).to have_content("#{@green_smoothie.complexity}")
    expect(page).to have_content("#{@green_smoothie.genre}")
  end

  it "lists ingredients" do
    visit "/recipes/#{@bowl_of_cereal.id}"

    expect(page).to have_content("#{@bowl_of_cereal.ingredients.first.name}")
    expect(page).to have_content("#{@bowl_of_cereal.ingredients.second.name}")
    
    visit "/recipes/#{@green_smoothie.id}"

    expect(page).to have_content("#{@green_smoothie.ingredients.first.name}")
    expect(page).to have_content("#{@green_smoothie.ingredients.second.name}")
    expect(page).to have_content("#{@green_smoothie.ingredients.third.name}")
    expect(page).to have_content("#{@green_smoothie.ingredients.fourth.name}")
  end

  it "displays total cost" do
    visit "/recipes/#{@bowl_of_cereal.id}"

    expect(page).to have_content("Total Cost: $#{@bowl_of_cereal.total_cost}")
    
    visit "/recipes/#{@green_smoothie.id}"

    expect(page).to have_content("Total Cost: $#{@green_smoothie.total_cost}")
  end

end
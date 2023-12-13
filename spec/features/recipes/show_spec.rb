require "rails_helper" 

RSpec.describe "Recipe" do 
  before(:each) do 
    @beef = Ingredient.create!(name: "Ground Beef", cost: 2)
    @salt = Ingredient.create!(name: "Salt", cost: 4)
    @shepherd_pie = Recipe.create!(name: "Shepherd's Pie", complexity: 9, genre: "Meat Lovers")

    @shep_beef = RecipeIngredient.create!(recipe_id: @shepherd_pie.id, ingredient_id: @beef.id)
    @shep_salt = RecipeIngredient.create!(recipe_id: @shepherd_pie.id, ingredient_id: @salt.id)
  end

  it "shows a total cost of all the ingredients in the recipe" do 
    visit "/recipes/#{@shepherd_pie.id}"

    save_and_open_page

    expect(page).to have_content("Shepherd's Pie")
    expect(page).to have_content("Ingredients")
    expect(page).to have_content("Ground Beef")
    expect(page).to have_content("Salt")
    expect(page).to have_content("Complexity")
    expect(page).to have_content("9/10")
    expect(page).to have_content("Genre")
    expect(page).to have_content("Meat Lovers")
  end
end 
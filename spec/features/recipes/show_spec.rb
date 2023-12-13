require "rails_helper" 

RSpec.describe "Recipe" do 
  before(:each) do 
    @salt = Ingredient.create!(name: "Salt", cost: 4)
    @peas = Ingredient.create!(name: "Peas", cost: 7)
    @beef = Ingredient.create!(name: "Ground Beef", cost: 24)
    @pepper = Ingredient.create!(name: "Pepper", cost: 6)
    @marinara = Ingredient.create!(name: "Marinara", cost: 22)

    @shepherd_pie = Recipe.create!(name: "Shepherd's Pie", complexity: 9, genre: "Meat Lovers")

    @shep_beef = RecipeIngredient.create!(recipe_id: @shepherd_pie.id, ingredient_id: @beef.id)
    @shep_salt = RecipeIngredient.create!(recipe_id: @shepherd_pie.id, ingredient_id: @salt.id)
    @shep_peas = RecipeIngredient.create!(recipe_id: @shepherd_pie.id, ingredient_id: @peas.id)
  end

  it "shows a total cost of all the ingredients in the recipe" do 
    visit "/recipes/#{@shepherd_pie.id}"

    expect(page).to have_content("Shepherd's Pie")
    expect(page).to have_content("Ingredients")
    expect(page).to have_content("Ground Beef")
    expect(page).to have_content("Peas")
    expect(page).to have_content("Salt")
    expect(page).to have_content("Complexity")
    expect(page).to have_content("9/10")
    expect(page).to have_content("Genre")
    expect(page).to have_content("Meat Lovers")
  end

  it "displays the total cost of all the recipe ingredients" do 
    visit "/recipes/#{@shepherd_pie.id}"

    expect(page).to have_content("Total Cost: #{@shepherd_pie.total_cost}")
  end
  
  it "users can add any ingredient in the system to a recipe" do 
    visit "/recipes/#{@shepherd_pie.id}"

    expect(page).to have_content("Add ingredient")
    expect(page).to have_field(:ingredient_id)
    expect(page).to have_button("Add")

    expect(page).to_not have_content("Marinara")


    fill_in(:ingredient_id, with: @marinara.id)

    click_button "Add"

    @shep_mara = RecipeIngredient.last

    expect(current_path).to eq("/recipes/#{@shepherd_pie.id}")
    
    expect(page).to have_content("Marinara")

    expect(page).to have_content("#{Ingredient.find(@shep_mara.ingredient_id).name} has successfully been added.")
    
    save_and_open_page

    fill_in(:ingredient_id, with: 4234523)

    click_button "Add"

    expect(current_path).to eq("/recipes/#{@shepherd_pie.id}")
    expect(page).to have_content("Houston, it appears we have a problem. I don't think we carry that ingredient.")
  end

end 
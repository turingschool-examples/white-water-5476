require "rails_helper" 

RSpec.describe "Recipe" do 
  before(:each) do 
    @beef = Ingredient.create!(name: "Ground Beef", cost: 2)
    @salt = Ingredient.create!(name: "Salt", cost: 4)
    @shepherd_pie = Recipe.create!(name: "Beef Wellington", complexity: 9, genre: "Classic")

    @shep_ingredients = @shepherd_pie.ingredients << @salt
    @shep_ingredients = @shepherd_pie.ingredients << @beef
  end

  it "shows a total cost of all the ingredients in the recipe" do 
    visit "/recipes/#{@shepherd_pie.id}"

    expect(page).to have_content("#{@shepherd_pie} Recipe")
    expect(page).to have_content("Ingredients")
    expect(page).to have_content("Ground Beef")
    expect(page).to have_content("Salt")
  end
end 
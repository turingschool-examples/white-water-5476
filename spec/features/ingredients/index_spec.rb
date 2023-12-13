require "rails_helper" 

RSpec.describe "Ingredients Index Page" do 
  before(:each) do 
    @salt = Ingredient.create!(name: "Salt", cost: 4)
    @peas = Ingredient.create!(name: "Peas", cost: 7)
    @beef = Ingredient.create!(name: "Ground Beef", cost: 2)
    @pepper = Ingredient.create!(name: "Pepper", cost: 6)
    @marinara = Ingredient.create!(name: "Marinara", cost: 22)
  end

  it "shows a list of all the ingredient names and cost info" do 
    
    visit "/ingredients" 
    
    expect(page).to have_content("Ground Beef: 2")
    expect(page).to have_content("Salt: 4")
  end

  it "orders ingredients alphabetically by name" do 
    visit "/ingredients" 

    expect("Ground Beef").to appear_before("Marinara")
    expect("Marinara").to appear_before("Peas")
    expect("Pepper").to appear_before("Salt")
  end
end 
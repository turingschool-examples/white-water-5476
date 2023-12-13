require "rails_helper" 

RSpec.describe "Ingredients Index Page" do 
  before(:each) do 
    @beef = Ingredient.create!(name: "Ground Beef", cost: 2)
    @salt = Ingredient.create!(name: "Salt", cost: 4)
  end
  it "shows a list of all the ingredient names and cost info" do 
    
    visit "/ingredients" 
    
    expect(page).to have_content("Ground Beef: 2")
    expect(page).to have_content("Salt: 4")
  end
end 
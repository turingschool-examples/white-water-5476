require 'rails_helper'
RSpec.describe "Ingredients page" do 
  it "shows list of all ingredients" do 
    # before (:each) do
    Salt = Ingredient.create!(name:"Salt", cost:20)
    Ground_beef=Ingredient.create!(name:"Ground Beef", cost:40)
    Pepper =Ingredient.create!(name:"Pepper", cost:45)
    Ginger =Ingredient.create!(name:'Ginger', cost:50)
  
     
    visit "/ingredients"
    expect(page).to have_content("Salt")
    expect(page).to have_content("Ground Beef")
    expect(page).to have_content("Pepper")
    expect(page).to have_content("Ginger")
    expect(page).to have_content("20")
    expect(page).to have_content("40")
    expect(page).to have_content("45")
    expect(page).to have_content("50")

    Ingredient.all.each do |ingredient|
      expect(page).to have_content(ingredient.name)
      expect(page).to have_content(ingredient.cost)
    end
  end
end

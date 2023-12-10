require "rails_helper"

describe "the ingredients index page" do
    it "lists all the ingredients with their attributes" do
      ground_beef = Ingredient.create(name: "Ground Beef", cost: 4)
      garlic = Ingredient.create(name: "Garlic", cost: 2)
      tomato_paste = Ingredient.create(name: "Tomato Paste", cost: 1)
      
      visit "/ingredients"

      expect(page).to have_content("Ground Beef")
      expect(page).to have_content("Garlic")
      expect(page).to have_content("Tomato Paste")
      expect(page).to have_content("4")
      expect(page).to have_content("2")
      expect(page).to have_content("1")
    end
end
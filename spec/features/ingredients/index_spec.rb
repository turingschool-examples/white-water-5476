require "rails_helper"

RSpec.describe "Ingredients Index" do
  before(:each) do
    @ingredient_1 = Ingredient.create(name: "Paprika", cost: 3)
    @ingredient_2 = Ingredient.create(name: "Garlic Powder", cost: 3)
    @ingredient_3 = Ingredient.create(name: "Ground Beef", cost: 4)

  end
  it "has a list of all the ingredients inlcuding their name and cost" do
    visit "/ingredients"

    expect(page).to have_content("Ingredient: Paprika")
    expect(page).to have_content("Cost: 3")
    expect(page).to have_content("Ingredient: Ground Beef")
    expect(page).to have_content("Cost: 4")
  end

  describe "Extension 1" do
    it "has ingredients displayed alphabetically by name" do
      visit "/ingredients"

      expect("Garlic Powder").to appear_before("Ground Beef")
      expect("Ground Beef").to appear_before("Paprika")
    end
  end
end

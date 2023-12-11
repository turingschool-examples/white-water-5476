require "rails_helper"

RSpec.describe "the recipe ingredient new page" do
  before(:each) do
      @beef_pasta = Recipe.create(name: "Beef Pasta", complexity: 2, genre: "Italian")
      @ground_beef = @beef_pasta.ingredients.create(name: "Ground Beef", cost: 4)
      @garlic = @beef_pasta.ingredients.create(name: "@garlic", cost: 2)
      @tomato_paste = @beef_pasta.ingredients.create(name: "Tomato Paste", cost: 1)
  end

  it "renders the new form" do
    visit "/recipes/#{@beef_pasta.id}/new"

    expect(find("form")).to have_content("Ingredient Name")
    expect(find("form")).to have_content("Ingredient Cost")
  end

  it "creates the new recipe ingredient" do
    visit "/recipes/#{@beef_pasta.id}/new"

    fill_in "Ingredient Name", with: "Ancient Lobster"
    fill_in "Ingredient Cost", with: 450
    click_button "Save"

    expect(page).to have_current_path("/recipes/#{@beef_pasta.id}")
    expect(page).to have_content("Ancient Lobster")
  end

end

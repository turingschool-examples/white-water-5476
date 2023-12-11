require "rails_helper"

RSpec.describe "the ingredients index" do
  before(:each) do
    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
  end

  it "lists all the ingredients attributes" do
    visit "/ingredients"
save_and_open_page
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_1.cost)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_2.cost)

  end

end
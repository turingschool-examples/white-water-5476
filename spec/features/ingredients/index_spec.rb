require "rails_helper"

describe 'Ingredients Index Page' do
  it 'lists all the ingredients including their name as well as cost' do
    ingredient_1 = ground_beef = Ingredient.create(name: "Ground Beef", cost: 2)
    ingredient_2 = salt = Ingredient.create(name: "Salt", cost: 4)

    visit '/ingredients'

    expect(page).to have_content("#{ingredient_1.name}: #{ingredient_1.cost}")
    expect(page).to have_content("#{ingredient_2.name}: #{ingredient_2.cost}")
  end
end
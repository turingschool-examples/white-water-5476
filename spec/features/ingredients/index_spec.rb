require "rails_helper"

describe 'Ingredients Index Page' do
  it 'lists all the ingredients including their name as well as cost' do
    ingredient_1 = ground_beef = Ingredient.create(name: "Ground Beef", cost: 2)
    ingredient_2 = salt = Ingredient.create(name: "Salt", cost: 4)

    visit '/ingredients'

    expect(page).to have_content("#{ingredient_1.name}: #{ingredient_1.cost}")
    expect(page).to have_content("#{ingredient_2.name}: #{ingredient_2.cost}")
  end

  it 'lists ingredients alphabetically by name' do
    ingredient_1 = Ingredient.create(name: "Rice", cost: 1)
    ingredient_2 = Ingredient.create(name: "Saffron", cost: 4)
    ingredient_3 = Ingredient.create(name: "Butter", cost: 1)
    ingredient_4 = Ingredient.create(name: "Cilantro", cost: 2)
    ingredient_5 = Ingredient.create(name: "Parsley", cost: 2)
  
    visit '/ingredients'
  
    expect(ingredient_3.name).to appear_before(ingredient_4.name)
    expect(ingredient_4.name).to appear_before(ingredient_5.name)
    expect(ingredient_5.name).to appear_before(ingredient_1.name)
    expect(ingredient_1.name).to appear_before(ingredient_2.name)
  end
end
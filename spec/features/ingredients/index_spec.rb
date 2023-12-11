require "rails_helper"

RSpec.describe 'Ingredients Index' do
  it 'visitor views a list of ingrediets with name and cost' do
    ingrediet1 = Ingredient.create(name: 'Ground Beef', cost: 2)
    ingrediet2 = Ingredient.create(name: 'Salt', cost: 4)

    visit "/ingredients"

    # save_and_open_page

    expect(page).to have_content(ingrediet1.name)
    expect(page).to have_content(ingrediet1.cost)
    
    
    expect(page).to have_content(ingrediet2.name)
    expect(page).to have_content(ingrediet2.cost)
  end
end
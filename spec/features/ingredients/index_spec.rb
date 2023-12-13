require "rails_helper"


describe "As a visitor" do
    # As a visitor
    before(:each) do
        beef = Ingredient.create(name: "Ground Beef", cost: 2)
        salt = Ingredient.create(name: "Salt", cost: 4)
        tacobell = Ingredient.create(name: "Taco Bell", cost: 9)
    end
    
    it 'Can list all ingredients' do
        # When I visit '/ingredients'
        visit '/ingredients'
        # I see a list of all the ingredients including their name and cost
        expect(page).to have_content("Ground Beef")
        expect(page).to have_content("2")
        expect(page).to have_content("Salt")
        expect(page).to have_content("4")
        expect(page).to have_content("Taco Bell")
        expect(page).to have_content("9")
    end
end
require "rails_helper"


describe "As a visitor" do
    # As a visitor
    before(:each) do
        beef = Ingredient.create(name: "Ground Beef", cost: 2)
        salt = Ingredient.create(name: "Salt", cost: 4)
        tacobell = Ingredient.create(name: "Taco Bell", cost: 9)

        burrito = Recipe.create(name: "Burrito", complexity: 3, genre: "Mexican")
        steak = Recipe.create(name: "Steak", complexity: 2, genre: "American")
    end
    
    it 'Can show burrito recipes' do
        # When I visit '/recipes/:id','
        visit "/recipes/#{@burrito.id}"

        # Then I see the recipe's name, complexity and genre,
        expect(page).to have_content("Burrito")
        expect(page).to have_content(3)
        expect(page).to have_content("Mexican")

        # and I see a list of the names of the ingredients for the recipe.
        expect(page).to have_content("Ground Beef")
        expect(page).to have_content("Taco Bell")
    end

    it 'Can show steak recipes' do
        # When I visit '/recipes/:id','
        visit "/recipes/#{@steak.id}"

        # Then I see the recipe's name, complexity and genre,
        expect(page).to have_content("Steak")
        expect(page).to have_content(2)
        expect(page).to have_content("American")

        # and I see a list of the names of the ingredients for the recipe.
        expect(page).to have_content("Ground Beef")
        expect(page).to have_content("Salt")
    end
end
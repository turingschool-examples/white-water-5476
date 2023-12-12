require "rails_helper"

RSpec.describe Ingredient, type: :model do

  describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
  end

  describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
  end

  describe "instance methods" do
  	describe "#ingredients_alphabetized" do
      it "alphabetizes the ingredients per recipe" do
				enchiladas = Recipe.create!(name: "Enchiladas", complexity: 4, genre: "Tex-Mex")

				ground_beef = Ingredient.create!(name: "Ground Beef", cost: 2)
				cheese = Ingredient.create!(name: "Cheese", cost: 3)
				tomatillo = Ingredient.create!(name: "Tomatillo", cost: 5)
				tortilla = Ingredient.create!(name: "Tortilla", cost: 6)
		
				enchiladas.ingredients << [ground_beef, cheese, tomatillo, tortilla] 
				
				expect(enchiladas.ingredients_alphabetized).to eq([cheese, ground_beef, tomatillo, tortilla])
      end
    end
  end
end
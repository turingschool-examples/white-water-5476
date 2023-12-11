require "rails_helper"

RSpec.describe Ingredient, type: :model do
   before(:each) do
      @recipe_1 = Recipe.create(name: "Spaghetti", complexity: 5, genre: "Italian")
      @recipe_2 = Recipe.create(name: "Pot Roast", complexity: 6, genre: "American")
      @ingredient_1 = @recipe_1.ingredients.create(name: "Paprika", cost: 3)
      @ingredient_2 =  @recipe_1.ingredients.create(name: "Garlic Powder", cost: 3)
      @ingredient_3 = @recipe_1.ingredients.create(name: "Ground beef", cost: 4)
   end
   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   describe "#self.sort_alphabetically(column)" do
      it "can sort Ingredients alphabetically by column" do
         expect(Ingredient.sort_alphabetically(:name)).to eq [@ingredient_2, @ingredient_3, @ingredient_1]
      end
   end
end

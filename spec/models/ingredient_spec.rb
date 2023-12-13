require "rails_helper"

RSpec.describe Ingredient, type: :model do
   before(:each) do 
      @salt = Ingredient.create!(name: "Salt", cost: 4)
      @peas = Ingredient.create!(name: "Peas", cost: 7)
      @beef = Ingredient.create!(name: "Ground Beef", cost: 2)
      @pepper = Ingredient.create!(name: "Pepper", cost: 6)
      @marinara = Ingredient.create!(name: "Marinara", cost: 22)
   end

   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   describe "class methods" do 
      describe ".alpha_order" do 
         it "orders the list of ingredients alphabetically by name" do 
            expect(Ingredient.alpha_order).to eq([@beef, @marinara, @peas, @pepper, @salt])
         end
      end
   end

end
require "rails_helper"

RSpec.describe Recipe, type: :model do
  before(:each) do 
    @beef = Ingredient.create!(name: "Ground Beef", cost: 36)
    @peas = Ingredient.create!(name: "Peas", cost: 12)
    @salt = Ingredient.create!(name: "Salt", cost: 3)

    @shepherd_pie = Recipe.create!(name: "Shepherd's Pie", complexity: 9, genre: "Meat Lovers")

    @shep_beef = RecipeIngredient.create!(recipe_id: @shepherd_pie.id, ingredient_id: @beef.id)
    @shep_salt = RecipeIngredient.create!(recipe_id: @shepherd_pie.id, ingredient_id: @salt.id)
    @shep_peas = RecipeIngredient.create!(recipe_id: @shepherd_pie.id, ingredient_id: @peas.id)
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe "instance methods" do 
    describe "#total_cost" do 
      it "returns the total cost of all the ingredients in a recipe" do 
        expect(@shepherd_pie.total_cost).to eq(51)
      end
    end
  end
end
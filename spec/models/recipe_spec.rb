require "rails_helper"

RSpec.describe Recipe, type: :model do
  before(:each) do
    @recipe_1 = Recipe.create(name: "Spaghetti", complexity: 5, genre: "Italian")
    @recipe_2 = Recipe.create(name: "Pot Roast", complexity: 6, genre: "American")
    @ingredient_1 = @recipe_1.ingredients.create(name: "Paprika", cost: 3)
    @ingredient_2 =  @recipe_1.ingredients.create(name: "Garlic Powder", cost: 3)
    @ingredient_3 = @recipe_1.ingredients.create(name: "Ground beef", cost: 4)
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

  describe "#total_cost" do
    it "finds the sum of the cost of a recipe's ingredeints " do
      expect(@recipe_1.total_cost).to eq 10
    end
  end

  describe "#add_ingredients" do
    it "can find an existing ingredient by it's ID, and add it to the recipe" do
      pasta = Ingredient.create(id: 4, name: "Pasta", cost: 2)
      @recipe_1.add_ingredients(4)
      expect(@recipe_1.ingredients).to eq(pasta)

    end
 end
end

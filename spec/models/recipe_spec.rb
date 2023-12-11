require "rails_helper"

RSpec.describe Recipe, type: :model do
   
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe "total_cost" do
    it "correctly calculates total cost" do
      @recipe = Recipe.create(name: "Spaghetti with Meatballs", complexity: 1, genre: "Italian")
      @ingredient_1 = Ingredient.create(name: "Ground Beef", cost: 2)
      @ingredient_2 = Ingredient.create(name: "Spices", cost: 4)
      @ingredient_3 = Ingredient.create(name: "Pasta Sauce", cost: 6)
      @ingredient_4 = Ingredient.create(name: "Spaghetti Noodles", cost: 4)
      @ingredient_5 = Ingredient.create(name: "Sardines", cost: 3)

      @recipe.ingredients << [@ingredient_1, @ingredient_2, @ingredient_3, @ingredient_4]

      expect(@recipe.total_cost).to eq(16)
      expect(@recipe.total_cost).to_not eq(32)
      expect(@recipe.total_cost).to_not eq(nil)
    end
  end
end
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

  before(:each) do
    @milk = Ingredient.create!(name: "Milk", cost: 4)
    @cereal = Ingredient.create!(name: "Cereal", cost: 6)
    @banana = Ingredient.create!(name: "Banana", cost: 2)
    @pineapple = Ingredient.create!(name: "Pineapple", cost: 4)
    @spinach = Ingredient.create!(name: "Spinach", cost: 5)
    @white_grape_juice = Ingredient.create!(name: "White Grape Juice", cost: 4)
    
    @bowl_of_cereal = Recipe.create!(name: "Bowl of Cereal", complexity: 1, genre: "Breakfast")
    @green_smoothie = Recipe.create!(name: "Green Smoothie", complexity: 2, genre: "Breakfast")
    
    @recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: @bowl_of_cereal.id, ingredient_id: @milk.id)
    @recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: @bowl_of_cereal.id, ingredient_id: @cereal.id)
    @recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: @green_smoothie.id, ingredient_id: @banana.id)
    @recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: @green_smoothie.id, ingredient_id: @pineapple.id)
    @recipe_ingredient_5 = RecipeIngredient.create!(recipe_id: @green_smoothie.id, ingredient_id: @spinach.id)
    @recipe_ingredient_6 = RecipeIngredient.create!(recipe_id: @green_smoothie.id, ingredient_id: @white_grape_juice.id)
  end

  describe "#total_cost" do
    it "calculates total cost of ingredients" do
      expect(@bowl_of_cereal.total_cost).to eq(10)
      expect(@green_smoothie.total_cost).to eq(15)
    end
  end

end
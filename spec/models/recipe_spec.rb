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

  describe "methods" do
    it "has a method to find the total cost of a recipe" do
      spaghet = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Pasta")
      cheese = spaghet.ingredients.create!(name: "Cheese", cost: 3)
      noods = spaghet.ingredients.create!(name: "Noodles", cost: 2)
      herbals = spaghet.ingredients.create!(name: "Herbs", cost: 1)
      sauce = spaghet.ingredients.create!(name: "Red Sauce", cost: 5)

      expect(spaghet.total_cost).to eq(11)
    end
  end
end

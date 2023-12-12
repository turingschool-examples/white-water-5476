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

  describe 'instance method' do
    describe '#total_cost' do
      it "total's the cost of ingredients" do
        meal = Recipe.create!(name: "spicy tacos", complexity: 1, genre: "mexican")

        item_1 = Ingredient.create!(name: "salt", cost: 1)
        item_2 = Ingredient.create!(name: "pepper", cost: 2)

        meal.ingredients << item_1 << item_2

        expect(meal.total_cost).to eq(3)
      end
    end
  end
end
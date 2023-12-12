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

  describe "instance methods" do
    describe "#total_cost" do

    
      it "adds the total cost of all ingredients per recipe" do
        enchiladas = Recipe.create!(name: "Enchiladas", complexity: 4, genre: "Tex-Mex")

        ground_beef = Ingredient.create!(name: "Ground Beef", cost: 2)
        cheese = Ingredient.create!(name: "Cheese", cost: 3)
        tomatillo = Ingredient.create!(name: "Tomatillo", cost: 5)
        tortilla = Ingredient.create!(name: "Tortilla", cost: 6)
    
        enchiladas.ingredients << [ground_beef, cheese, tomatillo, tortilla] 
        expect(enchiladas.total_cost).to eq(16)
      end
    end

  end

end
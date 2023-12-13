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

  describe 'total costs of ingedients method' do
    it 'can sum the #total_cost of ingredients' do
    recipe_1 = Recipe.create(name: "Ghormesabzi", complexity: 5, genre: "Persian")
    
    ingredient_1 = Ingredient.create(name: "Rice", cost: 1)
    ingredient_2 = Ingredient.create(name: "Saffron", cost: 4)
    ingredient_3 = Ingredient.create(name: "Butter", cost: 1)
    ingredient_4 = Ingredient.create(name: "Cilantro", cost: 2)
    ingredient_5 = Ingredient.create(name: "Parsley", cost: 2)

    RecipeIngredient.create(recipe: recipe_1, ingredient: ingredient_1)
    RecipeIngredient.create(recipe: recipe_1, ingredient: ingredient_2)
    RecipeIngredient.create(recipe: recipe_1, ingredient: ingredient_3)
    RecipeIngredient.create(recipe: recipe_1, ingredient: ingredient_4)
    RecipeIngredient.create(recipe: recipe_1, ingredient: ingredient_5)

    expect(recipe_1.total_cost).to eq(10)
    end
  end
end
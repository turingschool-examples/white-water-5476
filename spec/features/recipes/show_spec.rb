require "rails_helper"

describe 'Recipe Show Page' do
  it 'it shows the recipe name, complexity, and genre' do
    recipe_1 = Recipe.create(name: "Ghormesabzi", complexity: 5, genre: "Persian")

    ingredient_1 = Ingredient.create(name: "Rice", cost: 1)
    ingredient_2 = Ingredient.create(name: "Saffron", cost: 4)
    ingredient_3 = Ingredient.create(name: "Butter", cost: 1)

    RecipeIngredient.create(recipe: recipe_1, ingredient: ingredient_1)
    RecipeIngredient.create(recipe: recipe_1, ingredient: ingredient_2)
    RecipeIngredient.create(recipe: recipe_1, ingredient: ingredient_3)

    visit "recipes/#{recipe_1.id}"

    expect(page).to have_content("Name: #{recipe_1.name}")
    expect(page).to have_content("Complexity: #{recipe_1.complexity}")
    expect(page).to have_content("Genre: #{recipe_1.genre}")
  end
  
  it 'shows a list of the names of the ingredients for the recipe' do
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

    visit "recipes/#{recipe_1.id}"

    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
    expect(page).to have_content(ingredient_3.name)
    expect(page).to have_content(ingredient_4.name)
    expect(page).to have_content(ingredient_5.name)
  end

  it 'shows a list of the names of the ingredients for the recipe' do
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

    visit "recipes/#{recipe_1.id}"

    expect(page).to have_content("Total Cost: #{recipe_1.total_cost}")
  end
end
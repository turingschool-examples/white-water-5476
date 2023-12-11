# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@recipe_1 = Recipe.create(name: "Spaghetti", complexity: 5, genre: "Italian")
@recipe_2 = Recipe.create(name: "Pot Roast", complexity: 6, genre: "American")
@ingredient_1 = @recipe_1.ingredients.create(name: "Paprika", cost: 3)
@ingredient_2 =  @recipe_1.ingredients.create(name: "Garlic Powder", cost: 3)
@ingredient_3 = @recipe_1.ingredients.create(name: "Ground beef", cost: 4)
@ingredient_4 = Ingredient.create(name: "Pasta", cost: 2)

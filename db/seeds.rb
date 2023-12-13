# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

RecipeIngredient.destroy_all
Ingredient.destroy_all
Recipe.destroy_all

@beef = Ingredient.create!(name: "Ground Beef", cost: 24)
@peas = Ingredient.create!(name: "Peas", cost: 7)
@salt = Ingredient.create!(name: "Salt", cost: 4)
@pepper = Ingredient.create!(name: "Pepper", cost: 6)
@marinara = Ingredient.create!(name: "Marinara", cost: 22)

@shepherd_pie = Recipe.create!(name: "Shepherd's Pie", complexity: 9, genre: "Meat Lovers")

# @shep_beef = RecipeIngredient.create!(recipe_id: @shepherd_pie.id, ingredient_id: @beef.id)
# @shep_salt = RecipeIngredient.create!(recipe_id: @shepherd_pie.id, ingredient_id: @salt.id)
# @shep_peas = RecipeIngredient.create!(recipe_id: @shepherd_pie.id, ingredient_id: @peas.id)
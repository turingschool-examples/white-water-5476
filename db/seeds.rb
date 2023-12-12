# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@milk = Ingredient.create!(name: "Milk", cost: 4)
@cereal = Ingredient.create!(name: "Cereal", cost: 6)
@banana = Ingredient.create!(name: "Banana", cost: 2)
@pineapple = Ingredient.create!(name: "Pineapple", cost: 4)
@spinach = Ingredient.create!(name: "Spinach", cost: 5)
@white_grape_juice = Ingredient.create!(name: "White Grape Juice", cost: 4)

@bowl_of_cereal = Recipe.create!(name: "Bowl of Cereal", complexity: 1, genre: "Breakfast")
@green_smoothie = Recipe.create!(name: "Green Smoothie", complexity: 2, genre: "Breakfast")
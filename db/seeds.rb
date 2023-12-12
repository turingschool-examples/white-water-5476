# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
f_alfredo = Recipe.create!(name: "Fetuccini Alfredo", complexity: 1, genre: "Italian")
chili = Recipe.create!(name: "Chili", complexity: 2, genre: "American")
curry = Recipe.create!(name: "Curry", complexity: 3, genre: "Indian")


pasta = Ingredient.create!(name:"Pasta", cost: 2)
pasta_sauce = Ingredient.create!(name:"Pasta Sauce", cost: 2)
parmesan = Ingredient.create!(name:"Parmesan", cost: 3)
mushrooms = Ingredient.create!(name:"Mushrooms", cost: 2)
salt = Ingredient.create!(name:"Salt", cost: 1)
beans = Ingredient.create!(name:"Beans", cost: 2)
tomatoes = Ingredient.create!(name:"Tomatoes", cost: 2)
broth = Ingredient.create!(name:"Broth", cost: 2)
chicken = Ingredient.create!(name:"Chicken", cost: 5)
curry_paste = Ingredient.create!(name:"Curry Paste", cost: 2)
coconut_milk = Ingredient.create!(name:"Coconut Milk", cost: 2)
sweet_potatoes = Ingredient.create!(name:"Sweet Potatoes", cost: 2)

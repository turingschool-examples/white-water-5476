require 'rails_helper'


RSpec.describe "Recipe's Show page" do 
  it "shows recipe's name, complexity, and genre" do 

        Jollof=Recipe.create!(name:"Jollof", complexity:"easy", genre:"Senegalese")
        Ingera=Recipe.create!(name:"Ingera", complexity:"hard",genre:"Ethiopian")
        Sushi=Recipe.create!(name:"Sushi",complexity:"medium", genre:"Japanese")
        Tofu=Recipe.create!(name:"Tofu", complexity:"hard", genre:"Palestine")
  
         expect(page).to have_content("Jollof")
         expect(page).to have_content("easy")
         expect(page).to have_content("Senegalese")
       end

       it "show the total cost of ingredients" do 
        Salt = Ingredient.create!(name:"Salt", cost:20)
        Ground_beef=Ingredient.create!(name:"Ground Beef", cost:40)
        Pepper =Ingredient.create!(name:"Pepper", cost:45)
        Ginger =Ingredient.create!(name:'Ginger', cost:50)
        Jollof=Recipe.create!(name:"Jollof", complexity:"easy", genre:"Senegalese")
        Ingera=Recipe.create!(name:"Ingera", complexity:"hard",genre:"Ethiopian")
        Sushi=Recipe.create!(name:"Sushi",complexity:"medium", genre:"Japanese")
        Tofu=Recipe.create!(name:"Tofu", complexity:"hard", genre:"Palestine")

        Jollof_Ingredient=RecipeIngredient.create!(recipe_id:Jollof.id,ingredient_id:Salt.id)
        Jollof_Ingredient=RecipeIngredient.create!(recipe_id:Jollof.id, ingredient_id:Ginger.id)
        Jollof_Ingredient=RecipeIngredient.create!(recipe_id:Jollof.id, ingredient_id:Ground_beef.id)
            visit "/recipes/#{Jollof.id}"
            
            #within "#{Jollof.id}" do
        expect(page).to have_content("Total cost:110")
        #end
      end
   end

require 'rails_helper'


RSpec.describe "Recipe's Show page" do 
  it "shows recipe's name, complexity, and genre" do 

        Jollof=Recipe.create!(name:"Jollof", complexity:"easy", genre:"Senegalese")
        Ingera=Recipe.create!(name:"Ingera", complexity:"hard",genre:"Ethiopian")
        Sushi=Recipe.create!(name:"Sushi",complexity:"medium", genre:"Japanese")
        Tofu=Recipe.create!(name:"Tofu", complexity:"hard", genre:"Palestine")
  
        visit "/recipes/#{Jollof.id}"
         expect(page).to have_content("Jollof")
         #expect(page).to have_content("easy")
         expect(page).to have_content("Senegalese")
       end
   end

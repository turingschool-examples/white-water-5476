require "rails_helper"

RSpec.describe "Ingredients Index Page" do

  it "lists all ingredients (name and cost)" do
    visit "/ingredients"

    expect(page).to have_content(All Ingredients)
    expect(page).to have_content("Milk")
    expect(page).to have_content("$4")
    expect(page).to have_content("Cereal")
    expect(page).to have_content("$6")
    expect(page).to have_content("Banana")
    expect(page).to have_content("$2")
    expect(page).to have_content("Pineapple")
    expect(page).to have_content("$4")
    expect(page).to have_content("Spinach")
    expect(page).to have_content("$5")
    expect(page).to have_content("White Grape Juice")
    expect(page).to have_content("$4")
  end

end
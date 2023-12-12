Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/ingredients", to: "ingredients#index"

  get "/recipes/:id", to: "recipes#show"

  get "/recipes/:id/new", to: "recipe_ingredients#new"
  post "/recipes/:id", to: "recipe_ingredients#create"
end

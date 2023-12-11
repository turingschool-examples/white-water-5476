Rails.application.routes.draw do
  get 'recipes/show'
  get 'ingredients/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Ingredients Routes
  get "/ingredients", to: "ingredients#index"

  # Recipes Routes
  get "/recipes/:id", to: "recipes#show"
  post "/recipes/:id/add_ingredient", to: "recipes#add_ingredient"
end

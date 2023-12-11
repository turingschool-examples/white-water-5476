Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

get "/ingredients", to: "ingredients#index"

get "recipes/:id", to: "recipes#show"
end

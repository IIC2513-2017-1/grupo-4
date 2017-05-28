Rails.application.routes.draw do
  # Users routes
  resources :users

  # Authentication
  get "/signup", to: "users#signup_new"
  post "/signup", to: "users#signup_create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  # Categories routes
  resources :categories

  # Products routes
  resources :products do
    post "/cart", to: "shopping_carts#add"
    delete "/cart", to: "shopping_carts#destroy"
  end
  get "/cart", to: "shopping_carts#index"

  resources :products do 
    resources :comments, only: [:create, :destroy]
  end
  
  # Root route
  root "home#index"
end

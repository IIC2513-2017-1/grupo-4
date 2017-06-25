Rails.application.routes.draw do
  # Users routes
  resources :users

  # Authentication
  get "/signup", to: "users#signup_new"
  post "/signup", to: "users#signup_create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  # User routes
  resources :users, except: :new do 
    get "/wishlist", to: "wish_lists#index"
    post "/wishlist", to: "transactions#wishlist_transaction"
  end
  get "/signup", to: "users#new"
  get "/login", to: "users#login"
  resources :categories
  get 'products/show'

  # Categories routes
  resources :categories

  # Products routes
  resources :products do
    post "/cart", to: "shopping_carts#add"
    delete "/cart", to: "shopping_carts#destroy"
    post "/wishlist", to: "wish_lists#add"    
    delete "/wishlist", to: "wish_lists#destroy"
  end
  get "/cart", to: "shopping_carts#index"  

  resources :products do 
    resources :comments, only: [:create, :destroy]
  end

  # Transactions routes
  resources :transactions do
    post "/dispatch", to: "transactions#dispatch_"  
  end

  # Dashboard
  get "/dashboard", to: "dashboards#index"

  # profile
  get "/profile", to: "profiles#index"
  get "/profile/edit", to: "profiles#edit"
  
  # Root route
  root "home#index"
end
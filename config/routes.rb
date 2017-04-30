Rails.application.routes.draw do
  # User routes
  resources :users

  # Authentication
  get "/signup", to: "users#signup_new"
  post "/signup", to: "users#signup_create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  # Root route
  root "static_pages#home"
end

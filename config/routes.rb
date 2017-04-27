Rails.application.routes.draw do
  # User routes
  resources :users, except: :new
  get "/signup", to: "users#new"
  get "/login", to: "users#login"

  # Root route
  root "static_pages#home"
end

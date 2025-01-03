Rails.application.routes.draw do
  get "meals/index"
  get "less_than5_ingredients/index"
  get "less_than30_mins/index"
  get "desserts/index"
  get "snacks/index"
  get "breakfasts/index"
  get "meal_planner/index"
  resources :tags
  resources :steps
  resources :ingredients
  get "search", to: "search#index"
  devise_for :users
  resources :recipes
  #get "home/index"
  get 'home/about'
  root 'home#index'
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "/recipes/:id", to: "recipes#show"

  # Defines the root path route ("/")
  # root "posts#index"
end

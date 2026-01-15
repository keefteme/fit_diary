Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :food_entries
  resources :products
  resources :meal_types
  resources :food_categories
  resources :workout_items, only: [] do
    resources :workout_sets, only: [:create, :destroy]
  end
  resources :workouts do
    resources :workout_items, only: [:create, :destroy]
  end
  resources :exercises
  resources :muscle_groups
  resources :measurements
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "home/index"

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end

Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :items
  resources :categories
  resources :stores
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
end

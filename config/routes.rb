Rails.application.routes.draw do
  resources :payments
  resources :orders do
    collection do
      get 'active_orders'
    end
    member do
      get 'add_ordered_product'
      get 'print'
      put 'add_product'
      put 'close'
    end
  end
  devise_for :users
  resources :products do
    collection do
      post 'add_product_items'
      delete 'destroy_product_item'
    end
  end
  resources :items
  resources :categories
  resources :working_stations
  resources :stores
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
end

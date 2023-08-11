Rails.application.routes.draw do
  resources :providers
  resources :payments
  resources :orders do
    collection do
      get 'active_orders'
      get 'closed_orders'
    end
    member do
      get 'add_ordered_product'
      get 'print'
      get 'view_ordered_product'
      put 'add_product'
      put 'close'
      put 'add_discount'
      put 'remove_discount'
      delete 'remove_ordered_product'
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
  resources :reports do
    collection do
      get 'daily_report'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
end

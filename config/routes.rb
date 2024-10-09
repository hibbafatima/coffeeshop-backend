Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#new"
  resources :users, only: [:new, :create]
  resources :items, only: [:index]
  resources :locations, only: [:index]
  resources :orders, only: [:index, :show, :new, :create]
end

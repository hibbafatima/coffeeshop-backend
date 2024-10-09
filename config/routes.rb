Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#new"
  resources :users, only: [:new, :create] do
    resources :orders, only: [:index, :show, :new, :create]
  end
  resources :items, only: [:index]
end

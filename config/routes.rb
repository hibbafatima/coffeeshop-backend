Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "items#index"
  resources :users, only: [:new, :create] do
    resources :orders, only: [:index, :show, :new, :create] do
      member do
        post :send_notification
      end
    end
  end
  resources :items, only: [:index]
  resources :locations, only: [:index]
end

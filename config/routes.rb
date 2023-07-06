Rails.application.routes.draw do
  devise_for :users
  resources :foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foods#index"
  delete '/users/sign_out', to: 'sessions#destroy'
  resources :foods, only: [:create, :index, :destroy, :new]
  resources :shopping_lists, only: [:index]
end

Rails.application.routes.draw do
  resources :foods, only: [:create, :index, :destroy, :new]
  resources :shopping_lists, only: [:index]
  resources :recipes

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'public_recipes/index'
  
  resources :recipes 
    resources :public_recipes

  root "foods#index"

end


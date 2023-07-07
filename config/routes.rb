# frozen_string_literal: true

Rails.application.routes.draw do
  resources :foods, only: [:create, :index, :destroy, :new]
  resources :shopping_lists, only: [:index]
  resources :recipes

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :recipes 
    resources :public_recipes

  root "foods#index"
  
  # put 'recipes/:id/toggle_button', to: 'recipes#toggle_action', as: 'toggle_action'
  post '/toggle', to: 'recipe#toggle'
  put 'recipes/:id/toggle_button', to: 'recipes#toggle_action', as: 'toggle_action'

  
end


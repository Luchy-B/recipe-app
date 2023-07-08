# frozen_string_literal: true

Rails.application.routes.draw do
  resources :foods, only: [:create, :index, :destroy, :new]
  get '/general_shopping_list/counts', to: 'general_shopping_list#counts'
  get 'general_shopping_list', to: 'general_shopping_list#index'
  
  resources :recipes do
    resources :ingredients, only: [:new, :create, :destroy]
  end
  
  devise_for :users
  
  resources :recipes 
    resources :public_recipes

  root "foods#index"
  
  # put 'recipes/:id/toggle_button', to: 'recipes#toggle_action', as: 'toggle_action'
  post '/toggle', to: 'recipe#toggle'
  put 'recipes/:id/toggle_button', to: 'recipes#toggle_action', as: 'toggle_action'
  put 'recipes/:id/toggle_public', to: 'recipes#toggle_public', as: 'toggle_public'
  
end


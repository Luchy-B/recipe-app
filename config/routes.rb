# frozen_string_literal: true

Rails.application.routes.draw do
  root 'recipes#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'public_recipes/index'

  resources :recipes
  resources :public_recipes
end

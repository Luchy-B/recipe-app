Rails.application.routes.draw do
  resources :foods, only: [:create, :index, :destroy, :new]
  get 'general_shopping_list', to: 'general_shopping_list#index'
  resources :recipes 
 
  
  

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foods#index"
end


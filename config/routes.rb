Rails.application.routes.draw do
  resources :foods, only: [:create, :index, :destroy, :new]
  resources :users do
    resource :shopping_list, only: [:show], controller: 'shopping_lists'
  end
  
  resources :recipes
  
  devise_for :users
  root "foods#index"
end


Rails.application.routes.draw do
  devise_for :users

  
  root "items#index"

  
  # resources :users, only: [:index, :new, :create, :edit, :show, :destroy, :update]
  resources :items, only: [:index, :new, :create, :edit, :show, :destroy, :update]
end

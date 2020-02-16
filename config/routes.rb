Rails.application.routes.draw do
  devise_for :users
  
  root "items#index"
  
  resources :items, only: [:index, :new, :create, :edit, :show, :destroy, :update]
  resources :cards, only: [:new, :create, :show, :destroy]
  resources :my_pages, only: [:index]

end

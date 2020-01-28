Rails.application.routes.draw do
  root "items#index"

  resources :items, only: [:index, :new, :create, :edit, :show, :destroy, :update]
end

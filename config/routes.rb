Rails.application.routes.draw do
  devise_for :users
  
  root "items#index"
  

  resources :cards, only: [:new, :create, :edit, :show, :destroy, :update]
  resources :my_pages, only: [:index]

  resources :items do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end


end

Rails.application.routes.draw do
  
  devise_for :users
  
  root "items#index"

  resources :cards, only: [:new, :create, :edit, :show, :destroy, :update]
  
  resources :my_pages, only: [:show]

  resources :items do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  #クレジット購入で今後、使用   
  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

end

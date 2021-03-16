Rails.application.routes.draw do

# 管理者側のルーティング

  # 管理者側ログイン
  devise_for :admins

  # 管理者側機能
  namespace :admin do
    get '/' => 'homes#top'
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_products, only: [:update]
  end

# 会員側のルーティング

  devise_for :customers

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'

    resources :products, only: [:show, :index]
    resources :cart_products, only: [:index, :create, :update, :destroy]
    delete '/cart_products/destroy_all' => 'cart_products#destroy_all', as:'destroy_all'
    resources :orders, only: [:index, :new, :create]
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/thanks' => 'orders#thanks'
    get '/orders/:id' => 'orders#show'
    resources :customers, only: [:edit, :update]
    get '/customers/my_page' => 'customers#show'
    get '/customers/confirm' => 'customers#confirm'
    patch '/customers/withdraw' => 'customers#withdraw'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

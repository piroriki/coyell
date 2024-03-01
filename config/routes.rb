Rails.application.routes.draw do

  devise_for :users, :controllers => { 
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  # ホーム画面用設定
  get 'tops/index'
  root to: "tops#index"
  resources :children

  devise_scope :user do # deviseで使用したいファイルのみルーティング設定
    get 'user/:id', :to => 'users/registrations#detail'
    get 'signup',   :to => 'users/registrations#new'
    get 'login',    :to => 'users/sessions#new'
    get 'logout',   :to => 'users/sessions#destroy'
  end

end

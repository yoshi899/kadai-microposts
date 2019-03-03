Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      
      # 課題で追加。中間テーブルから先にある、お気に入りユーザ一覧を表示する
      get :favorites
      get :unfavorites
      
      # 課題で追加。中間dbをfavoritesと作成したのでredirectさせる
      get :likes

    end
    # collectionは本lessonで使用しないのでコメントアウト
    # collection do
      # get :search
    # end
  end

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
  # 課題で追加。ログインユーザがユーザをお気に入りできるようにするルーティング
  resources :favorites, only: [:create, :destroy]
end
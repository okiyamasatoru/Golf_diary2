Rails.application.routes.draw do
  namespace :admin do
     resources :customers, only: [:show,:index,:edit,:update]
     resources :movies, only: [:show, :index, :destroy] do
       resources :comments, only: [:create, :destroy]
     end
     get "search" => "searches#search" 
  end
  namespace :public do
    resources :movies, only: [:new, :index, :show, :create, :edit,:destroy] do
     resources :comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :edit, :index, :update] do
     resource :relationships, only: [:create, :destroy]
     get 'followings' => 'relationships#followings', as: 'followings'
     get 'followers' => 'relationships#followers', as: 'followers'
    end
    get "search" => "searches#search"
    # 退会確認画面
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    # 論理削除用のルーティング
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  end
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
 root to: "homes#top"
 get 'homes/about',as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  namespace :public do
   resources :movies, only: [:new, :index, :show, :create, :edit,:destroy]
   resources :customer, only: [:show, :edit]
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

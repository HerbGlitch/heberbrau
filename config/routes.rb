Rails.application.routes.draw do
  get 'dm/index'
  get '/login', to: 'login#index'
  post '/login',   to: 'sessions#login'
  get '/register', to: 'login#index'
  post '/register',  to: 'sessions#register'
  get '/logout',  to: 'sessions#destroy'
  get '/dashboard', to: 'dashboard#index'
  get '/dm', to: 'dm#index'
  get '/dm/campaings', to: 'dm#campaigns'
  get '/dm/store', to: 'dm#store'
  resources :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
  authenticated :user do
    root :to => 'dashboard#index', :as => "authenticated_root"
  end

  root :to => 'home#show'
end

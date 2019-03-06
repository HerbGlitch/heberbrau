Rails.application.routes.draw do
  get '/login', to: 'login#index'
  post '/login',   to: 'sessions#login'
  get '/register', to: 'login#index'
  post '/register',  to: 'sessions#register'
  get '/logout',  to: 'sessions#destroy'
  get '/dashboard', to: 'dashboard#index'
  resources :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
  authenticated :user do
    root :to => 'dashboard#index', :as => "authenticated_root"
  end

  root :to => 'home#show'
end

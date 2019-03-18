Rails.application.routes.draw do
  #login
  get '/login', to: 'login#index'
  get '/register', to: 'login#index'
  #sessions
  get '/logout',  to: 'sessions#destroy'
  post '/login',   to: 'sessions#login'
  post '/register',  to: 'sessions#register'
  #profile
  get '/campaigns', to: 'profile#campaigns'
  get '/friend_search', to: 'profile#friend_search'
  #dm
  get '/dm', to: 'dm#index'
  get '/dm/campaings', to: 'dm#campaigns'
  get '/dm/store', to: 'dm#store'

  resources :users
  resources :relationships, only: [:create, :destroy]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }

  root :to => 'home#show'
end

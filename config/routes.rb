Rails.application.routes.draw do
  get '/sidebar_toggle', to: 'application#sidebar_toggle'
  #login
  get '/login-register', to: 'login#index'
  post '/login',   to: 'login#login'
  post '/register',  to: 'login#register'
  #sessions
  get '/logout',  to: 'sessions#destroy'
  #profile
  get '/profile/:id', to: 'profile#profile'
  get '/campaigns', to: 'profile#campaigns'
  get '/campaign/:id', to: 'profile#campaign'
  get '/friend_search', to: 'profile#friend_search'
  post '/update_user', to: 'profile#update_user'
  post '/create_campaign', to: 'profile#create_campaign'
  #dm
  get '/dm', to: 'dm#index'
  get '/dm/campaings', to: 'dm#campaigns'
  get '/dm/store', to: 'dm#store'
  #api auth
  post 'authenticate', to: 'authentication#authenticate'

  resources :users
  resources :relationships, only: [:create, :destroy]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }

  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :campaigns
    end
  end

  root :to => 'home#show'
end

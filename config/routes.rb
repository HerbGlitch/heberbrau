Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  # get 'auth/:provider/callback', to: 'sessions#create'
  # get 'auth/failure', to: redirect('/')
  # get 'signout', to: 'sessions#destroy', as: 'signout'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
  # devise_scope :user do
  #   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  root :to => 'home#show'

  # authenticated do
  #   root :to => 'dashboard#index'
  # end
end

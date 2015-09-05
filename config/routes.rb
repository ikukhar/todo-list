Rails.application.routes.draw do

  root 'page#index'

  namespace :users do
    get 'omniauth_callbacks/github'
  end

  namespace :users do
    get 'omniauth_callbacks/vkontakte'
  end

  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session_path
  end

  devise_for :users, controllers: { sessions: "users/sessions" }

  resources :projects, only: [:create, :update, :destroy]
  resources :tasks,    only: [:create, :update, :destroy]
  
end

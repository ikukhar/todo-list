Rails.application.routes.draw do

  root 'page#index'

  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session_path
  end

  devise_for :users, controllers: { sessions: "users/sessions", :omniauth_callbacks => "users/omniauth_callbacks"}

  resources :projects, only: [:create, :update, :destroy]
  resources :tasks,    only: [:create, :update, :destroy]

end

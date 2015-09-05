Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  root 'page#index'
  resources :projects, only: [:create, :update, :destroy]
  resources :tasks,    only: [:create, :update, :destroy]
end

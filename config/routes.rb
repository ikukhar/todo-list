Rails.application.routes.draw do
  root 'page#index'
  resources :projects, only: [:create, :update, :destroy]
  resources :tasks,    only: [:create, :update, :destroy]
end

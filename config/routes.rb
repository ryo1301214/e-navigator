Rails.application.routes.draw do
  devise_for :users
  root 'users#new'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end

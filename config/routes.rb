Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :profiles
  resources :static_pages, only: [:index]
end

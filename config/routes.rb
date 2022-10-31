Rails.application.routes.draw do
  root 'shops#index'
  devise_for :users

  resources :shops, only: [:index]
end

Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  get '/shops', to: 'homes#index'
  get '/shops/new', to: 'homes#authenticated'
  get '/shops/:id', to: 'homes#index'

  namespace :api do
    namespace :v1 do
      resources :shops, only: [:index, :show, :create]
    end
  end
end
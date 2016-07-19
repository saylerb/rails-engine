Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/merchants/random', to: "merchants/random#show"
      get '/merchants/find_all', to: "merchants/find#index"
      get '/merchants/find', to: "merchants/find#show"
      resources :merchants, only: [:index, :show]

      get '/customers/random', to: "customers#random"
      resources :customers, only: [:index, :show]
    end
  end
end

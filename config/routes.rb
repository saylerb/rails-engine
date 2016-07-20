Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :merchants, only: [:index, :show] do
        collection do
          get 'random', to: 'merchants/random#show'
          get 'find_all', to: 'merchants/find#index'
          get 'find', to: 'merchants/find#show'
        end
      end

      resources :customers, only: [:index, :show] do
        collection do
          get 'random'
          get 'find_all'
          get 'find'
        end
      end

      resources :items, only: [:index, :show] do
        collection do
          get 'random'
          get 'find_all'
          get 'find'
        end
      end

      resources :invoices, only: [:index, :show] do
        collection do
           get 'random'
           get 'find_all'
           get 'find'
         end
      end
    end
  end
end

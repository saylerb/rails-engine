Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :merchants, only: [:index, :show] do
        collection do
          get 'random', to: 'merchants/random#show'
          get 'find_all', to: 'merchants/find#index'
          get 'find', to: 'merchants/find#show'
          get '/:id/items', to: 'merchants/items#index'
          get '/:id/invoices', to: 'merchants/invoices#index'
        end
      end

      resources :customers, only: [:index, :show] do
        collection do
          get 'random'
          get 'find_all'
          get 'find'
        end

        member do
          get 'invoices'
          get 'transactions'
        end
      end

      resources :items, only: [:index, :show] do
        collection do
          get 'random'
          get 'find_all'
          get 'find'
        end

        member do
          get 'merchant'
          get 'invoice_items'
        end
      end

      resources :invoices, only: [:index, :show] do
        collection do
           get 'random'
           get 'find_all'
           get 'find'
         end

        member do
          get 'customer'
          get 'merchant'
          get 'transactions'
          get 'invoice_items'
          get 'items'
        end
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
           get 'random'
           get 'find_all'
           get 'find'
         end

        member do
          get 'invoice'
          get 'item'
        end
      end

      resources :transactions, only: [:index, :show] do
        collection do
           get 'random'
           get 'find_all'
           get 'find'
         end

        member do
          get 'invoice'
        end
      end
    end
  end
end

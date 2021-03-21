Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :authentication, only: [] do
        collection do
          post :authenticate
        end
      end

      resources :users
      resources :products
    end
  end

  root 'home#index'
end

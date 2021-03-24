require 'resque/server'

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :authentication, only: [] do
        collection do
          post :authenticate
          post :persist
        end
      end

      resources :users
      resources :products
    end
  end
  mount Resque::Server.new, at: "/resque"

  root 'home#index'
end

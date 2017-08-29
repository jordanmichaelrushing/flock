Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'exchanges#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  namespace :api do
    namespace :v1 do
      resources :exchanges
      resources :stock_quotes, only: [:new, :show, :create, :edit, :update, :index]
      resources :transactions
      resources :sessions, only: [:create, :destroy]
    end
  end

  resources :exchanges do
    resources :stocks, only: [:new, :edit, :index, :show]
  end
  resources :stocks, only: [:destroy, :create, :update]
  resources :stock_quotes, only: [:show, :index]
  resources :transactions

  
end

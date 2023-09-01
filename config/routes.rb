Rails.application.routes.draw do

  namespace :admin do
    root 'dashboard#index', as: :dashboard
    resources :users, only: [:index, :new, :create, :show, :destroy]
    resources :notifications, only: [:index, :show]
    resources :job_offers, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :applies, only: [:index, :show]
    end
    get 'last_applies', to: 'applies#index', as: :last_applies
  end
  

  namespace :regular_users do
    resources :dashboard, only: [:index]
    resources :users, only: [:show]
    resources :job_offers, only: [:index, :show] do
      resources :applies, only: [:index, :create]
    end
    get 'applies', to: 'applies#index', as: :applies
  end
  

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions' 
  }

  root 'home#index'
end





Rails.application.routes.draw do

  namespace :admin do
    root 'dashboard#index', as: :dashboard
    resources :dashboard, only: [:index]
    resources :users, only: [:new, :create, :show, :destroy] 
  end

  namespace :regular_users do
    root 'dashboard#index', as: :dashboard # Cambiado para que la página de inicio de los usuarios regulares sea su dashboard
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions' 
  }

  root 'regular_users/dashboard#index' # Cambiado para redirigir a la página de inicio de los usuarios regulares
end



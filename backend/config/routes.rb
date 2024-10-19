Rails.application.routes.draw do
  resources :manufacturers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }

  get 'users/current_user', to: 'users/current_user#index'
  get 'customers/current_customer', to: 'customers/current_customer#index'
end

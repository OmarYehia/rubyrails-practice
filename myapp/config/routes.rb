Rails.application.routes.draw do
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # } 

  root 'welcome#index'
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :articles
      end
    end
  end

  # API part
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end

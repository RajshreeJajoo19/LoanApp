Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'custom_sessions', registrations: 'signup' }

  resources :users, only: [:index, :destroy] do
    member do
      patch 'update_role'
    end
  end

  constraints(authenticated: true) do
    resources :loans
  end

  root 'pages#home'
  
  match '/*path', to: 'application#restrict_access', via: :all 

  get '/restrict_access', to: 'application#restrict_access', as: :restrict_access

  resources :loans
end
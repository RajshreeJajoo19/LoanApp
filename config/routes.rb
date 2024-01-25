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

  # Allow unauthenticated access to the home URL
  root 'pages#home'
  
  
  # Restrict access to all other URLs
  match '/*path', to: 'application#restrict_access', via: :all 

  resources :loans
end
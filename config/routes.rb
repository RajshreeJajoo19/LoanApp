Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'custom_sessions', registrations: 'signup' }


  resources :users, only: [:index, :destroy]


  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :loans


end

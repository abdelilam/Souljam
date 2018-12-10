Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'



  resources :jamms do
    resources :participations, only: [:new, :create, :destroy]
    patch 'accept', to: 'participations#accept', as: :accept
    patch 'refuse', to: 'participations#refuse', as: :refuse
    resources :messages, only: [:new, :create, :destroy]
  end

  get 'dashboard', to: 'pages#dashboard'

  resources :skills


end

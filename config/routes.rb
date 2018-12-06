Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'


  resources :jamms do
    resources :participants, only: [ :new, :create, :edit, :destroy ]
  end

  get 'dashboard', to: 'pages#dashboard'

  resources :skills


end

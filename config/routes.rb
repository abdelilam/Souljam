Rails.application.routes.draw do

  get 'participants/index'
  get 'participants/new'
  get 'participants/create'
  get 'participants/show'
  get 'participants/edit'
  get 'participants/update'
  get 'participants/destroy'
  devise_for :users
  root to: 'pages#home'


  resources :jamms do
    resources :participants, only: [ :new, :create, :edit, :destroy ]
  end

  get 'dashboard', to: 'users#dashboard' do

  namespace :dashboard do
    resources :instruments, only: [ :new, :create, :destroy]
    end
  end
end

Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users,
  						path: '',
  						path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
  						controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  resources :users, only: [:show]
  resources :playlists, only: [:show, :new, :create, :destroy]
  resources :tags, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]

  get 'search', to: 'pages#search'
end

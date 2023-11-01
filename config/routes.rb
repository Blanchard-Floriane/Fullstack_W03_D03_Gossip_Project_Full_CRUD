Rails.application.routes.draw do
  root to: "gossips#index" #donne l'info sur où se trouve la racine
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  #get 'author/:id', to: 'users#show', as: 'user'

  resources :gossips #va générer toutes les routes Gossip en auto
  resources :users
  resources :cities
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/explore', to: 'pages#explore', as: :explore
  get '/direct/inbox/', to: 'conversations#index', as: :inbox
  get '/direct/:id', to: 'conversations#show', as: :conversation
  get 'search' => 'search#index'
  resources :notifications, only: :index
  resources :conversations do
    resources :messages
  end
  resources :bookmarks
  resources :users, path: '/', param: :user_name, only: %i[show edit update] do
    resources :connections
    resources :conversations, only: %i[create]
  end

  resources :posts, path: '/p/' do
    resources :comments
    resources :likes
    resources :bookmarks, only: %i[new create destroy]
  end

  resources :comments, only: %i[show] do
    resources :likes
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

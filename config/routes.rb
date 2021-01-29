Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/explore', to: 'pages#explore', as: :explore
  get '/inbox', to: 'pages#inbox', as: :inbox
  resources :messages
  resources :conversations
  resources :users, path: '/', param: :user_name, only: %i[show] do
    resources :connections
  end

  resources :posts, path: '/p/' do
    resources :comments
    resources :likes
  end

  resources :comments, only: %i[show] do
    resources :likes
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

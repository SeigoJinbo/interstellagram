Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/explore', to: 'pages#explore', as: :explore
  get '/inbox', to: 'pages#inbox', as: :inbox
  resources :users, path: '/', param: :user_name, only: %i[show] do
    resources :connections
  end

  resources :posts, path: '/p/' do
    resources :comments
    resources :likes
  end

  resources :messages

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

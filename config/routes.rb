Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users

  resources :posts do
    resources :comments
    resources :likes
  end

  resources :messages
  get '/explore', to: 'pages#explore', as: :explore
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  resources :chat_groups, except: [:show, :destroy]
  root to: 'chat_groups#index'
end

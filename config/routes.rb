Rails.application.routes.draw do
  devise_for :users
  resources :chat_groups, except: [:show, :destroy]
    resources :messages, only: :index
  root to: 'chat_groups#index'
end

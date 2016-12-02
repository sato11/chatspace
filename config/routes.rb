Rails.application.routes.draw do
  devise_for :users
  resources :chat_groups, except: [:show, :destroy] do
    resources :messages, only: :index
  end
  root to: 'chat_groups#index'
end

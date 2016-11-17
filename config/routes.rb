Rails.application.routes.draw do
  devise_for :users
  resources :chat_groups, only: :index
end

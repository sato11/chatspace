Rails.application.routes.draw do
  devise_for :users
  resources :groups, except: [:destroy] do
    resources :messages, only: [:index, :create]
  end
  root to: 'groups#index'
end

# == Route Map
#
#                   Prefix Verb   URI Pattern                          Controller#Action
#         new_user_session GET    /users/sign_in(.:format)             devise/sessions#new
#             user_session POST   /users/sign_in(.:format)             devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)            devise/sessions#destroy
#            user_password POST   /users/password(.:format)            devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)        devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)       devise/passwords#edit
#                          PATCH  /users/password(.:format)            devise/passwords#update
#                          PUT    /users/password(.:format)            devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)              devise/registrations#cancel
#        user_registration POST   /users(.:format)                     devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)             devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                devise/registrations#edit
#                          PATCH  /users(.:format)                     devise/registrations#update
#                          PUT    /users(.:format)                     devise/registrations#update
#                          DELETE /users(.:format)                     devise/registrations#destroy
#           group_messages GET    /groups/:group_id/messages(.:format) messages#index
#                          POST   /groups/:group_id/messages(.:format) messages#create
#                   groups GET    /groups(.:format)                    groups#index
#                          POST   /groups(.:format)                    groups#create
#                new_group GET    /groups/new(.:format)                groups#new
#               edit_group GET    /groups/:id/edit(.:format)           groups#edit
#                    group GET    /groups/:id(.:format)                groups#show
#                          PATCH  /groups/:id(.:format)                groups#update
#                          PUT    /groups/:id(.:format)                groups#update
#                     root GET    /                                    groups#index
#                          GET    /*anything(.:format)                 errors#routing_error
#

Rails.application.routes.draw do
  devise_for :users
  resources :groups, except: [:destroy] do
    resources :messages, only: [:index, :create]
  end

  root to: 'groups#index'
  get '*anything' => 'errors#routing_error'
end

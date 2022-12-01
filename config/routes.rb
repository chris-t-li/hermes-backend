Rails.application.routes.draw do
  # resources :message_receivers
  resources :conversations, only: [:index, :show]
  resources :messages
  # resources :receivers
  # resources :senders
  resources :users
  
end

Rails.application.routes.draw do
  # resources :participants
  resources :conversations
  resources :messages, except: [:index]
  resources :users
  
end

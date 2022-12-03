Rails.application.routes.draw do
  # resources :participants
  resources :conversations
  resources :messages, except: [:index]
  # resources :users

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
end
